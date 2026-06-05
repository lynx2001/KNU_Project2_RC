# PCA(Parking Collision-Avoidance Assist)


```javascript
#!/usr/bin/env python3
import rclpy
from rclpy.node import Node
from geometry_msgs.msg import Twist
import serial

class PCASafetyNode(Node):
    def __init__(self):
        super().__init__('pca_safety_node')
        
        # --- 파라미터 (원할 때 외부에서 쉽게 값 변경 가능) ---
        self.declare_parameter('safe_distance_cm', 3.0)
        self.min_safe_dist = self.get_parameter('safe_distance_cm').value
        
        self.current_min_dist = 999.0
        self.latest_nav_cmd = Twist()
        self.pca_active = False

        # --- 아두이노 연결 ---
        try:
            self.arduino = serial.Serial('/dev/ttyACM0', 115200, timeout=0.05)
            self.get_logger().info('✅ PDW(아두이노) 연결 성공!')
        except serial.SerialException:
            self.get_logger().error('🚨 아두이노 시리얼 포트 에러!')
            self.arduino = None

        # --- 토픽 연결 ---
        # (중요) 주행 제어기(Pure Pursuit 등)가 출력하는 토픽을 구독합니다.
        self.sub_nav = self.create_subscription(Twist, '/nav_cmd_vel', self.nav_callback, 10)
        self.pub_cmd = self.create_publisher(Twist, '/cmd_vel', 10)

        self.timer = self.create_timer(0.02, self.control_loop)

    def nav_callback(self, msg):
        # 운전기사 노드가 내린 주행 명령 저장
        self.latest_nav_cmd = msg

    def control_loop(self):
        # 1. 초음파 데이터 파싱 (안전한 에러 처리)
        if self.arduino and self.arduino.in_waiting > 0:
            try:
                line = self.arduino.readline().decode('utf-8').strip()
                if line.startswith('S,') and line.endswith(',E'):
                    parts = line.split(',')
                    if len(parts) == 6:
                        # 4개 센서 중 최솟값 찾기
                        dists = [float(p) for p in parts[1:5]]
                        self.current_min_dist = min(dists)
            except (ValueError, UnicodeDecodeError):
                pass # 쓰레기값이 들어와도 무시 (안 뻗음)

        # 2. PCA 제동 판단 로직
        out_cmd = Twist()
        if self.current_min_dist < self.min_safe_dist:
            out_cmd.linear.x = 0.0
            out_cmd.angular.z = 0.0
            if not self.pca_active:
                self.get_logger().error(f'🛑 [PCA 발동] 장애물 감지: {self.current_min_dist}cm! 긴급 제동!')
                self.pca_active = True
        else:
            out_cmd = self.latest_nav_cmd
            if self.pca_active:
                self.get_logger().info('✅ [PCA 해제] 경로 클리어. 정상 주행 재개.')
                self.pca_active = False

        # 3. STM32(하드웨어)로 전달
        self.pub_cmd.publish(out_cmd)

def main(args=None):
    rclpy.init(args=args)
    node = PCASafetyNode()
    try:
        rclpy.spin(node)
    except KeyboardInterrupt:
        pass
    finally:
        if node.arduino and node.arduino.is_open:
            node.arduino.close()
        node.destroy_node()
        rclpy.shutdown()

if __name__ == '__main__':
    main()
```


## **1. 개요 (Overview)**



**주차 충돌방지 보조(PCA, Parking Collision-Avoidance Assist)**는 저속 주행 중 주변 장애물과의 충돌 위험을 감지하여 운전자에게 경고를 알리고, 충돌 직전 시스템이 모터를 능동적으로 제어하여 차량을 강제로 정지시키는 안전 기능입니다.


**💡 핵심 가치**
저속 주행(주차/출차) 시 부주의로 인한 사고를 미연에 방지하고, 물리적 제동을 통해 피해를 최소화함.



## **2. 작동 프로세스 (Operational Flow)**



시스템은 충돌을 방지하기 위해 아래의 4단계 과정을 실시간으로 반복 수행합니다.
1. **거리 감지 (Sensing)**: 센서를 통한 장애물과의 거리 측정
2. **위험 단계 판별 (Assessment)**: 충돌 가능성 및 위험 수위 판단
3. **제어권 오버라이드 (Override)**: 운전자 조작보다 시스템 제어 우선순위 상향
4. **긴급 제동 (Emergency Braking)**: 모터 인터럽트를 통한 강제 정지


## **3. 활성화 조건 (Activation Criteria)**



PCA 시스템은 다음 조건 중 하나를 충족할 때 활성화됩니다.
• **PAS(Parking Assist System) 연동**: PAS 시스템 활성화 중 **5단계(최근접)** 진입 시
• **저속 주행 상태**: 차량 속도가 **5km/h 미만**인 경우


## **4. PCA 제어 알고리즘 (Logic & Control)구분 상세 내용**


**제동 트리거:** PAS 시스템이 5단계(최단 거리) 진입 시 즉시 발생


**제어 우선순위:** 사용자의 가속/제동 페달 입력보다 **시스템의 제동 신호를 최우선**으로 설정 (Override)


**모터 제어:** 모터 드라이버의 입력 값을 직접 변경하여 **전자식 브레이크(E-Brake)** 구현


**제어권 회복:** 차량의 **완전 정지** 확인 후, 기어가 **D(전진) 또는 N(중립)**으로 변경될 때 해제



## **5. 확인 및 해제 (Termination)**


긴급 제동 이후 운전자가 다시 차량의 주도권을 갖기 위한 조건입니다.
• **완전 정지 확인**: 시스템에 의해 차량 속도가 0km/h에 도달했는지 판단.
• **기어 변속**: 사고 위험 구역에서 벗어나기 위해 기어를 변경(P→D 또는 R→N 등)하면 시스템 제어가 종료되고 운전자의 조작 신호를 다시 정상적으로 수용합니다.

