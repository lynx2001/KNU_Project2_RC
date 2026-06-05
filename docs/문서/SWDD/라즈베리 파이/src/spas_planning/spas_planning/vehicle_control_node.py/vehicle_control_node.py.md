# vehicle_control_node.py


```python
#!/usr/bin/env python3
import rclpy
from rclpy.node import Node
from nav_msgs.msg import Odometry, Path
from geometry_msgs.msg import Twist
from std_msgs.msg import Bool
import math

class VehicleControlNode(Node):
    def __init__(self):
        super().__init__('vehicle_control_node')

    # 1. 서브스크라이버 선언: 현재 위치, 주차 경로, 긴급 정지 상황 구독
        self.odom_sub = self.create_subscription(Odometry, '/odom', self.odom_callback, 10)
        self.path_sub = self.create_subscription(Path, '/parking_path', self.path_callback, 10)
        self.trigger_sub = self.create_subscription(Bool, '/emergency_trigger', self.emergency_callback, 10)

        # 2. 퍼블리셔 선언: safety_node가 가로채서 검사할 수 있도록 RAW 토픽으로 발행!
        self.cmd_pub = self.create_publisher(Twist, '/cmd_vel_raw', 10)

        # 3. 제어 알고리즘 파라미터 (RC카 제원에 맞춰 선언)
        self.wheelbase = 0.25         # 축거 (바퀴 축 간격, m)
        self.lookahead_dist = 0.3      # 조준 거리 (m, 값이 작을수록 경로에 칼같이 붙고, 크면 부드러워짐)
        self.target_speed = 0.15       # 기본 주행 속도 (m/s, 안전한 주차를 위해 저속 세팅)

        # 상태 변수 초기화
        self.current_path = None
        self.emergency_triggered = False
        self.robot_x = 0.0
        self.robot_y = 0.0
        self.robot_yaw = 0.0

        self.get_logger().info("Pure Pursuit 주차 추적 제어기(Vehicle Control Node) 활성화 완료.")

    def path_callback(self, msg):
        """ 새 주차 경로가 들어오면 제어기에 경로를 등록합니다. """
        if len(msg.poses) > 0:
            self.current_path = msg.poses
            self.get_logger().info(f"새로운 주차 경로가 제어기에 등록되었습니다. 웨이포인트 개수: {len(msg.poses)}")

    def emergency_callback(self, msg):
        """ 긴급 정지 상황 여부를 실시간으로 업데이트합니다. """
        self.emergency_triggered = msg.data

    def odom_callback(self, msg):
        """ 오도메트리가 들어올 때마다(약 50Hz) 가야 할 조향각을 실시간 연산하여 모터 명령 생성 """
        # 현재 차량 포즈 업데이트
        self.robot_x = msg.pose.pose.position.x
        self.robot_y = msg.pose.pose.position.y
        
        # 쿼터니언 각도를 Yaw 각도로 변환
        qz = msg.pose.pose.orientation.z
        qw = msg.pose.pose.orientation.w
        self.robot_yaw = 2.0 * math.atan2(qz, qw)

        # 출력할 속도 명령 박스 준비
        cmd_msg = Twist()

        # 만약 긴급 정지 상황이거나 등록된 주차 경로가 없으면 정지 명령을 쏩니다.
        if self.emergency_triggered or self.current_path is None:
            cmd_msg.linear.x = 0.0
            cmd_msg.angular.z = 0.0
            self.cmd_pub.publish(cmd_msg)
            return

        # 🎯 Pure Pursuit 핵심 연산 시작
        target_pt = self.get_lookahead_point()

        if target_pt is None:
            # 경로의 끝자락(종점)에 거의 도달했거나 경로를 완전히 이탈한 경우 정지
            self.get_logger().info("주차 목표 지점에 도달 완료하여 차량을 정지합니다.")
            self.current_path = None # 경로 초기화
            cmd_msg.linear.x = 0.0
            cmd_msg.angular.z = 0.0
            self.cmd_pub.publish(cmd_msg)
            return

        # 차량 기준 좌표계(Local Frame)로 조준점 위치 변환
        dx = target_pt.pose.position.x - self.robot_x
        dy = target_pt.pose.position.y - self.robot_y

        # 회전 변환 행렬을 적용하여 차량 중심 기준 상대 좌표(local_x, local_y) 도출
        local_x = dx * math.cos(-self.robot_yaw) - dy * math.sin(-self.robot_yaw)
        local_y = dx * math.sin(-self.robot_yaw) + dy * math.cos(-self.robot_yaw)

        # 🔄 전진/후진 판별 로직
        # 조준점이 차량 앞쪽에 있으면 전진, 뒤쪽에 있으면 후진 주차 상황임
        direction = 1.0 if local_x >= 0.0 else -1.0

        # 기하학적 Pure Pursuit 곡률 계산 공식
        # 조준 거리 정방형 분의 2 * 상대 Y축 변위
        L_sq = self.lookahead_dist ** 2
        curvature = (2.0 * local_y) / L_sq if L_sq > 0 else 0.0

        # 아커만 조향(Ackermann Steering) 공식에 따른 최종 핸들 조향각 계산
        # delta = atan(휠베이스 * 곡률)
        steering_angle = math.atan2(self.wheelbase * curvature, 1.0)

        # 최종 명령 적재 후 발행
        cmd_msg.linear.x = self.target_speed * direction  # 전진은 +, 후진은 - 속도 배정
        cmd_msg.angular.z = steering_angle                # 조향각 (라디안 단위)
        
        self.cmd_pub.publish(cmd_msg)

    def get_lookahead_point(self):
        """ 현재 차량 위치에서 조준 거리(Look-ahead)와 가장 일치하는 경로 상의 점을 검색 """
        best_wp = None
        min_dist_error = float('inf')

        for wp in self.current_path:
            dist = math.hypot(wp.pose.position.x - self.robot_x, wp.pose.position.y - self.robot_y)
            error = abs(dist - self.lookahead_dist)
            
            # 내가 설정한 조준 거리(30cm)와 거리 차이가 가장 적은 포인트를 픽합니다.
            if error < min_dist_error:
                min_dist_error = error
                best_wp = wp

        # 만약 최적의 포인트를 찾았더라도, 경로의 최종 종점과 내 차의 거리가 5cm 이내라면 다 온 것으로 판정
        final_wp = self.current_path[-1]
        final_dist = math.hypot(final_wp.pose.position.x - self.robot_x, final_wp.pose.position.y - self.robot_y)
        if final_dist < 0.05:
            return None

        return best_wp

def main(args=None):
    rclpy.init(args=args)
    node = VehicleControlNode()
    try:
        rclpy.spin(node)
    except KeyboardInterrupt:
        pass
    finally:
        node.destroy_node()
        rclpy.shutdown()

if __name__ == '__main__':
    main()
```

