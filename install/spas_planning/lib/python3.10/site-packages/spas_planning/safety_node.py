#!/usr/bin/env python3
import rclpy
from rclpy.node import Node
from std_msgs.msg import Float32MultiArray, Bool
from geometry_msgs.msg import Twist

class SafetyNode(Node):
    def __init__(self):
        super().__init__('safety_node')

        # 1. 서브스크라이버 선언: 초음파 거리 및 차량의 원래 제어 명령 감시
        # [전, 후, 좌, 우] 형태의 배열 수신
        self.distance_sub = self.create_subscription(Float32MultiArray, '/filtered_distance', self.distance_callback, 10)
        # vehicle_control_node가 보내는 주행 명령을 가로채기 위해 구독
        self.cmd_vel_sub = self.create_subscription(Twist, '/cmd_vel_raw', self.cmd_vel_raw_callback, 10)

        # 2. 퍼블리셔 선언: 최종 안전이 검증된 명령 송신 및 긴급 제동 플래그 발행
        # stm32_bridge_node가 최종적으로 받아서 실행할 안전한 cmd_vel
        self.cmd_vel_pub = self.create_publisher(Twist, '/cmd_vel', 10)
        # 다른 노드들에게 긴급 상황임을 알리는 플래그 방송
        self.trigger_pub = self.create_publisher(Bool, '/emergency_trigger', 10)

        # 3. 안전 파라미터 및 상태 변수 설정
        self.CRITICAL_DISTANCE = 4.0  # 긴급 정지 임계치 (4.0cm)
        self.emergency_trigger = False
        
        # 최신 초음파 거리 저장용 변수 [전, 후, 좌, 우] (초기값은 충분히 먼 거리인 400cm)
        self.current_distances = [400.0, 400.0, 400.0, 400.0]

        self.get_logger().info("안전 감시 브레인(Safety Node)이 활성화되었습니다.")

    def distance_callback(self, msg):
        """ 초음파 센서 값을 받아 실시간으로 거리를 갱신하는 콜백 함수 """
        if len(msg.data) == 4:
            self.current_distances = msg.data

    def cmd_vel_raw_callback(self, msg):
        """ 주행 제어기가 보낸 명령을 받아서, 안전 검사 후 STM32 브리지로 토스하는 핵심 함수 """
        front_dist = self.current_distances[0]
        back_dist  = self.current_distances[1]

        # 기본적으로 주행 노드가 보낸 속도와 조향각을 복사
        safe_cmd = Twist()
        safe_cmd.linear.x = msg.linear.x
        safe_cmd.angular.z = msg.angular.z

        # 🚨 [안전 검사 로직]
        # 상황 A: 차량이 전진(속도 > 0)하려는데 전방 거리가 임계치보다 가까운 경우
        if msg.linear.x > 0.0 and front_dist < self.CRITICAL_DISTANCE:
            self.emergency_trigger = True
            self.get_logger().error(f"🛑 [전방 위험!] 정면 장애물 감지 ({front_dist:.1f}cm). 강제 제동합니다!")

        # 상황 B: 차량이 후진(속도 < 0)하려는데 후방 거리가 임계치보다 가까운 경우
        elif msg.linear.x < 0.0 and back_dist < self.CRITICAL_DISTANCE:
            self.emergency_trigger = True
            self.get_logger().error(f"🛑 [후방 위험!] 후면 장애물 감지 ({back_dist:.1f}cm). 강제 제동합니다!")
        
        else:
            # 위험 상황이 아니면 플래그 해제
            self.emergency_trigger = False

        # 🛑 긴급 상황일 경우 모든 속도 명령을 무조건 0으로 차단!
        if self.emergency_trigger:
            safe_cmd.linear.x = 0.0
            # 조향(핸들)은 안전을 위해 그대로 유지하거나 필요시 0으로 제어
            safe_cmd.angular.z = msg.angular.z  

        # 최종 검증된(또는 차단된) 안전한 명령을 STM32 브리지가 보고 있는 토픽으로 최종 발행
        self.cmd_vel_pub.publish(safe_cmd)

        # 다른 노드들에게도 현재 긴급 상황 여부를 실시간 방송
        trigger_msg = Bool()
        trigger_msg.data = self.emergency_trigger
        self.trigger_pub.publish(trigger_msg)

def main(args=None):
    rclpy.init(args=args)
    node = SafetyNode()
    try:
        rclpy.spin(node)
    except KeyboardInterrupt:
        pass
    finally:
        node.destroy_node()
        rclpy.shutdown()

if __name__ == '__main__':
    main()