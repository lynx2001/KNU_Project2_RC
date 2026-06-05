# spas_control


## spas_control

## stm32_bridge_node.py

```python
#!/usr/bin/env python3
import rclpy
from rclpy.node import Node
from geometry_msgs.msg import Twist
from nav_msgs.msg import Odometry
from geometry_msgs.msg import TransformStamped
import tf2_ros

import serial
import struct
import math

class Stm32BridgeNode(Node):
    def __init__(self):
        super().__init__('stm32_bridge_node')
        
        # 1. ROS 2 퍼블리셔 및 서브스크라이버 선언
        # 판단 레이어로부터 주행 명령 수신
        self.cmd_vel_sub = self.create_subscription(Twist, '/cmd_vel', self.cmd_vel_callback, 10)
        # 판단 레이어 및 SLAM으로 오도메트리 좌표 정보 송신
        self.odom_pub = self.create_publisher(Odometry, '/odom', 10)
        # 실전용 동적 TF 브로드캐스터 생성 (odom -> base_link 위치 연결 고리)
        self.tf_broadcaster = tf2_ros.TransformBroadcaster(self)

        # 2. STM32 시리얼 포트 연결 설정 (CH9102F 내장 보드)
        stm32_port = '/dev/ttyUSB0'  # 라즈베리파이 환경에 맞게 ttyUSB1 등으로 변경 가능
        baud_rate = 115200
        try:
            self.ser = serial.Serial(stm32_port, baud_rate, timeout=0.1)
            self.ser.flush()
            self.get_logger().info(f"STM32 제어기 연결 성공: {stm32_port}")
        except Exception as e:
            self.get_logger().error(f"STM32 제어기 연결 실패: {e}")
            return

        # 3. 오도메트리(위치 추정) 연산용 변수 초기화
        self.x = 0.0        # 차량의 현재 X 좌표 (m)
        self.y = 0.0        # 차량의 현재 Y 좌표 (m)
        self.th = 0.0       # 차량의 현재 헤딩 각도 (Yaw, rad)
        self.last_time = self.get_clock().now()

        # 차량 제원 설정 (RC카의 물리적 수치에 맞게 추후 수정 가능)
        self.wheel_track = 0.22  # 좌우 바퀴 간격 (m)

        # 4. STM32로부터 데이터(엔코더 피드백)를 수신하기 위한 고속 주기 타이머 (50Hz = 0.02초)
        self.create_timer(0.02, self.read_stm32_data)

    # ──────────────────────────────────────────────────────────
    # TX: 라즈베리파이 -> STM32 (명령 송신)
    # ──────────────────────────────────────────────────────────
    def cmd_vel_callback(self, msg):
        # ROS 2의 m/s 및 rad/s 단위를 STM32용 정수 데이터형으로 변환
        # 선속도: m/s -> mm/s 단위 정수로 변환
        linear_x_mm = int(msg.linear.x * 1000.0)
        # 조향각: rad -> 0.01도 단위 정수로 변환
        steering_deg_001 = int(math.degrees(msg.angular.z) * 100.0)

        # 헥사 패킷 규격 빌드: 헤더(0x55, 0xAA), CMD(0x01), 데이터 길이(4바이트)
        header = b'\x55\xAA'
        cmd_id = b'\x01'
        length = b'\x04'
        
        # Payload 패킹: h(signed short, 2바이트) 2개로 묶음 -> 총 4바이트
        payload = struct.pack('<hh', linear_x_mm, steering_deg_001)

        # 체크섬 계산 (Header부터 Payload까지의 모든 바이트 합의 하위 1바이트)
        full_packet_without_cs = header + cmd_id + length + payload
        checksum = bytes([sum(full_packet_without_cs) & 0xFF])

        # 최종 패킷 완성 후 STM32로 전송
        final_packet = full_packet_without_cs + checksum
        try:
            self.ser.write(final_packet)
        except Exception as e:
            self.get_logger().error(f"STM32 명령 송신 실패: {e}")

    # ──────────────────────────────────────────────────────────
    # RX: STM32 -> 라즈베리파이 (피드백 수신 및 /odom 연산)
    # ──────────────────────────────────────────────────────────
    def read_stm32_data(self):
        # 수신 버퍼에 최소 패킷 크기(헤더2+CMD1+LEN1+DATA4+CS1 = 9바이트) 이상 쌓였는지 확인
        if self.ser.in_waiting >= 9:
            # 0x55 0xAA 헤더를 찾기 위한 정렬 동기화 로직
            if self.ser.read(1) == b'\x55':
                if self.ser.read(1) == b'\xAA':
                    cmd_id = self.ser.read(1)
                    length = int.from_bytes(self.ser.read(1), byteorder='little')
                    
                    # 피드백 데이터 패킷(CMD: 0x02)인지 검증
                    if cmd_id == b'\x02' and length == 4:
                        payload = self.ser.read(4)
                        checksum = self.ser.read(1)
                        
                        # 체크섬 무결성 검증
                        calc_sum = (0x55 + 0xAA + int.from_bytes(cmd_id, 'little') + length + sum(payload)) & 0xFF
                        if checksum == bytes([calc_sum]):
                            # 데이터 해독: 좌/우 바퀴 속도 (mm/s) -> m/s 단위 실수로 복원
                            left_vel_mm, right_vel_mm = struct.unpack('<hh', payload)
                            v_left = left_vel_mm / 1000.0
                            v_right = right_vel_mm / 1000.0

                            # 데드 레코닝(Dead Reckoning) 기반 오도메트리 연산 수행
                            self.calculate_odometry(v_left, v_right)
                        else:
                            self.get_logger().warn("STM32 수신 패킷의 체크섬이 일치하지 않습니다.")

    def calculate_odometry(self, v_left, v_right):
        current_time = self.get_clock().now()
        dt = (current_time - self.last_time).nanoseconds / 1e9
        self.last_time = current_time

        if dt <= 0.0:
            return

        # 두 바퀴의 속도를 바탕으로 차량 중심의 선속도(v)와 각속도(w) 산출
        v = (v_right + v_left) / 2.0
        w = (v_right - v_left) / self.wheel_track

        # 삼각함수를 통한 실시간 로봇 상대 좌표 변위 계산
        delta_x = (v * math.cos(self.th)) * dt
        delta_y = (v * math.sin(self.th)) * dt
        delta_th = w * dt

        # 절대 좌표계 누적
        self.x += delta_x
        self.y += delta_y
        self.th += delta_th

        # 오일러 각도(Yaw)를 ROS 2 표준 사원수(Quaternion) 구조로 변환
        cy = math.cos(self.th * 0.5)
        sy = math.sin(self.th * 0.5)
        odom_quat = [0.0, 0.0, sy, cy]

        # 1. Dynamic TF 브로드캐스팅 발행 (기존의 임시 고정 static TF 명령을 완벽히 대체!)
        t = TransformStamped()
        t.header.stamp = current_time.to_msg()
        t.header.frame_id = 'odom'
        t.child_frame_id = 'base_link'
        t.transform.translation.x = self.x
        t.transform.translation.y = self.y
        t.transform.translation.z = 0.0
        t.transform.rotation.x = odom_quat[0]
        t.transform.rotation.y = odom_quat[1]
        t.transform.rotation.z = odom_quat[2]
        t.transform.rotation.w = odom_quat[3]
        self.tf_broadcaster.sendTransform(t)

        # 2. Odometry 토픽 메시지 발행
        odom = Odometry()
        odom.header.stamp = current_time.to_msg()
        odom.header.frame_id = 'odom'
        odom.child_frame_id = 'base_link'
        odom.pose.pose.position.x = self.x
        odom.pose.pose.position.y = self.y
        odom.pose.pose.position.z = 0.0
        odom.pose.pose.orientation.x = odom_quat[0]
        odom.pose.pose.orientation.y = odom_quat[1]
        odom.pose.pose.orientation.z = odom_quat[2]
        odom.pose.pose.orientation.w = odom_quat[3]
        odom.twist.twist.linear.x = v
        odom.twist.twist.angular.z = w
        self.odom_pub.publish(odom)

def main(args=None):
    rclpy.init(args=args)
    node = Stm32BridgeNode()
    try:
        rclpy.spin(node)
    except KeyboardInterrupt:
        pass
    finally:
        if hasattr(node, 'ser') and node.ser.is_open:
            node.ser.close()
        node.destroy_node()
        rclpy.shutdown()

if __name__ == '__main__':
    main()
```

