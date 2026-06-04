#!/usr/bin/env python3
"""
SPAS STM32 Bridge Node  ―  Hiwonder ROS Robot Control Board (STM32F407VET6)
============================================================================
정품 SDK(ros_robot_controller_sdk.Board)를 사용해 보드와 통신한다.
프로토콜은 SDK가 처리하므로(0xAA 0x55 / CRC8 / 1Mbps) 우리는 고수준 API만 호출.

【구동 방식】 애커만 (구동모터 + 조향 PWM 서보)
  /cmd_vel (Twist) 수신
    linear.x  = 목표 선속도 (m/s)
    angular.z = 목표 조향각 (rad)   ← 이 스택의 vehicle_control_node 규약
  → board.set_motor_speed()       : 구동모터 속도 (float)
  → board.pwm_servo_set_position(): 조향 서보 펄스 (us)

【오도메트리】 ⚠️ 이 SDK/펌웨어는 바퀴 엔코더 피드백을 제공하지 않는다.
  따라서 /odom 은 명령값 기반 개루프 자전거 모델로 추정한다(드리프트 있음).
    th += v*tan(steer)/wheelbase * dt ;  x += v*cos th *dt ;  y += v*sin th *dt
  발행: /odom (Odometry) + TF odom→base_link

【캘리브레이션 필수 파라미터】 보드 배선/기구마다 다름. 최초 구동 전 반드시
  바퀴를 들어 올린 상태에서 아래 값을 확인/조정할 것.
    drive_motor_ids      : 구동모터가 꽂힌 채널(1~4) 목록
    motor_speed_per_mps  : m/s → set_motor_speed float 변환 게인
    motor_dir            : 전진 부호(+1/-1)
    steering_servo_id    : 조향 서보 채널(1~4)
    steering_center_us   : 직진(중립) 펄스(us)
    steering_us_per_rad  : 조향각(rad) → us 변환 게인
    steering_dir         : 조향 부호(+1/-1)
"""

import math

import rclpy
import tf2_ros
from geometry_msgs.msg import TransformStamped, Twist
from nav_msgs.msg import Odometry
from rclpy.node import Node

from .ros_robot_controller_sdk import Board


class Stm32BridgeNode(Node):
    def __init__(self):
        super().__init__('stm32_bridge_node')

        # ── 파라미터 ──────────────────────────────────────────────────
        self.declare_parameter('serial_port',        '/dev/ttyACM0')
        self.declare_parameter('baud_rate',          1000000)   # Hiwonder 보드 = 1Mbps
        self.declare_parameter('drive_motor_ids',    [2])       # 구동모터 채널(1~4)
        self.declare_parameter('motor_speed_per_mps', 1.0)      # m/s → float (캘리브레이션)
        self.declare_parameter('motor_speed_limit',  0.5)       # |float| 상한 (안전)
        self.declare_parameter('motor_dir',          1)         # 전진 부호
        self.declare_parameter('steering_servo_id',  1)         # 조향 서보 채널(1~4)
        self.declare_parameter('steering_center_us', 1500)
        self.declare_parameter('steering_us_per_rad', 400.0)    # rad → us (캘리브레이션)
        self.declare_parameter('steering_dir',       1)         # 조향 부호
        self.declare_parameter('steering_min_us',    1000)
        self.declare_parameter('steering_max_us',    2000)
        self.declare_parameter('wheelbase',          0.25)      # odom 개루프용 축거(m)
        self.declare_parameter('cmd_timeout',        0.5)       # 명령 끊기면 정지(초)
        self.declare_parameter('control_rate',       20.0)      # 제어 송신 주기(Hz)
        self.declare_parameter('odom_rate',          50.0)      # odom 적분 주기(Hz)

        g = self.get_parameter
        self._port       = g('serial_port').value
        self._baud       = g('baud_rate').value
        self._drive_ids  = list(g('drive_motor_ids').value)
        self._spd_gain   = g('motor_speed_per_mps').value
        self._spd_lim    = abs(g('motor_speed_limit').value)
        self._motor_dir  = 1 if g('motor_dir').value >= 0 else -1
        self._servo_id   = g('steering_servo_id').value
        self._center_us  = g('steering_center_us').value
        self._us_per_rad = g('steering_us_per_rad').value
        self._steer_dir  = 1 if g('steering_dir').value >= 0 else -1
        self._min_us     = g('steering_min_us').value
        self._max_us     = g('steering_max_us').value
        self._wheelbase  = g('wheelbase').value
        self._cmd_timeout = g('cmd_timeout').value

        # ── 보드 연결 ────────────────────────────────────────────────
        try:
            self.board = Board(device=self._port, baudrate=self._baud, timeout=0.05)
            self.board.enable_reception()
            self.get_logger().info(
                f"STM32(Hiwonder) 연결 성공: {self._port} @ {self._baud}bps"
            )
        except Exception as e:
            self.get_logger().error(f"STM32 연결 실패 ({self._port}): {e}")
            self.board = None
            return

        # ── ROS 인터페이스 ───────────────────────────────────────────
        self.cmd_vel_sub = self.create_subscription(Twist, '/cmd_vel', self.cmd_vel_callback, 10)
        self.odom_pub = self.create_publisher(Odometry, '/odom', 10)
        self.tf_broadcaster = tf2_ros.TransformBroadcaster(self)

        # 명령/오도메트리 상태
        self._cmd_v      = 0.0
        self._cmd_steer  = 0.0
        self._last_cmd_time  = self.get_clock().now()
        self.x = self.y = self.th = 0.0
        self._last_odom_time = self.get_clock().now()

        self.create_timer(1.0 / g('control_rate').value, self._control_tick)
        self.create_timer(1.0 / g('odom_rate').value,    self._odom_tick)

        self.get_logger().warn(
            "애커만 STM32 브리지 시작. ⚠️ 최초 구동은 반드시 바퀴를 들어 올린 채로! "
            "drive_motor_ids/steering_servo_id 와 변환 게인을 먼저 검증하세요."
        )

    # ── /cmd_vel 콜백 ────────────────────────────────────────────────
    def cmd_vel_callback(self, msg: Twist):
        # 이 스택 규약: linear.x=선속도(m/s), angular.z=조향각(rad)
        self._cmd_v     = msg.linear.x
        self._cmd_steer = msg.angular.z
        self._last_cmd_time = self.get_clock().now()

    # ── 제어 송신 (모터 + 조향 서보) ─────────────────────────────────
    def _control_tick(self):
        if self.board is None:
            return

        # 명령 타임아웃 시 정지 (안전)
        dt_cmd = (self.get_clock().now() - self._last_cmd_time).nanoseconds / 1e9
        v     = 0.0 if dt_cmd > self._cmd_timeout else self._cmd_v
        steer = 0.0 if dt_cmd > self._cmd_timeout else self._cmd_steer

        # 모터 속도(float) 변환 + 클램프
        speed = self._motor_dir * v * self._spd_gain
        speed = max(-self._spd_lim, min(self._spd_lim, speed))
        try:
            self.board.set_motor_speed([[mid, speed] for mid in self._drive_ids])
        except Exception as e:
            self.get_logger().warn(f"set_motor_speed 실패: {e}", throttle_duration_sec=2.0)

        # 조향 서보 펄스(us) 변환 + 클램프
        us = int(self._center_us + self._steer_dir * self._us_per_rad * steer)
        us = max(self._min_us, min(self._max_us, us))
        try:
            self.board.pwm_servo_set_position(0.02, [[self._servo_id, us]])
        except Exception as e:
            self.get_logger().warn(f"pwm_servo_set_position 실패: {e}", throttle_duration_sec=2.0)

    # ── 개루프 오도메트리 (엔코더 없음 → 명령 기반 자전거 모델) ──────
    def _odom_tick(self):
        now = self.get_clock().now()
        dt = (now - self._last_odom_time).nanoseconds / 1e9
        self._last_odom_time = now
        if dt <= 0.0:
            return

        dt_cmd = (now - self._last_cmd_time).nanoseconds / 1e9
        v     = 0.0 if dt_cmd > self._cmd_timeout else self._cmd_v
        steer = 0.0 if dt_cmd > self._cmd_timeout else self._cmd_steer

        yaw_rate = v * math.tan(steer) / self._wheelbase
        self.th += yaw_rate * dt
        self.x  += v * math.cos(self.th) * dt
        self.y  += v * math.sin(self.th) * dt

        qz = math.sin(self.th / 2.0)
        qw = math.cos(self.th / 2.0)

        t = TransformStamped()
        t.header.stamp    = now.to_msg()
        t.header.frame_id = 'odom'
        t.child_frame_id  = 'base_link'
        t.transform.translation.x = self.x
        t.transform.translation.y = self.y
        t.transform.translation.z = 0.0
        t.transform.rotation.z = qz
        t.transform.rotation.w = qw
        self.tf_broadcaster.sendTransform(t)

        odom = Odometry()
        odom.header.stamp    = now.to_msg()
        odom.header.frame_id = 'odom'
        odom.child_frame_id  = 'base_link'
        odom.pose.pose.position.x = self.x
        odom.pose.pose.position.y = self.y
        odom.pose.pose.orientation.z = qz
        odom.pose.pose.orientation.w = qw
        odom.twist.twist.linear.x  = v
        odom.twist.twist.angular.z = yaw_rate
        self.odom_pub.publish(odom)


def main(args=None):
    rclpy.init(args=args)
    node = Stm32BridgeNode()
    try:
        rclpy.spin(node)
    except KeyboardInterrupt:
        pass
    finally:
        # 종료 시 모터 정지 시도
        board = getattr(node, 'board', None)
        if board is not None:
            try:
                board.set_motor_speed([[mid, 0.0] for mid in node._drive_ids])
            except Exception:
                pass
        node.destroy_node()
        rclpy.shutdown()


if __name__ == '__main__':
    main()
