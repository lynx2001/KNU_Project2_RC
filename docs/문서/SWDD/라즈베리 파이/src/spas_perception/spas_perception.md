# spas_perception


## spas_perception

## sensor_filter_node.py

```python
#!/usr/bin/env python3
import rclpy
from rclpy.node import Node
from std_msgs.msg import Float32MultiArray  # 소수점 데이터 배열을 위한 메시지 타입
import serial

class SensorFilterNode(Node):
    def __init__(self):
        super().__init__('sensor_filter_node')
        
        # 1. 판단 레이어(Master Brain)로 정제된 데이터를 보낼 토픽 퍼블리셔 선언
        # 데이터 순서 양식: [전방, 후방, 좌측, 우측]
        self.distance_pub = self.create_publisher(Float32MultiArray, '/filtered_distance', 10)
        
        # 2. 아두이노 연결 설정 (아두이노 코드의 115200 보드레이트와 일치 필수)
        # 라즈베리파이에 아두이노를 연결한 포트 경로를 적어줍니다. ('/dev/ttyACM0' 등)
        arduino_port = '/dev/ttyACM0' 
        baud_rate = 115200
        
        try:
            self.ser = serial.Serial(arduino_port, baud_rate, timeout=1)
            self.ser.flush()  # 시리얼 버퍼 초기화 (쓰레기 데이터 방지)
            self.get_logger().info(f"아두이노(초음파 센서) 시리얼 연결 성공: {arduino_port}")
        except Exception as e:
            self.get_logger().error(f"아두이노 시리얼 연결 실패: {e}")
            return
            
        # 3. 아두이노의 데이터 송신 주기(50ms)에 맞추어 20Hz(0.05초) 타이머 루프 생성
        self.timer = self.create_timer(0.05, self.process_sensor_data)

    def process_sensor_data(self):
        # 시리얼 수신 버퍼에 데이터가 쌓여있는지 확인
        if self.ser.in_waiting > 0:
            try:
                # 아두이노가 보낸 한 줄을 읽고 엔터(\r\n) 제거
                # 예: "S,12.5,145.0,80.2,21.0,E"
                raw_line = self.ser.readline().decode('utf-8').rstrip()
                
                # 콤마(,)를 기준으로 패킷 쪼개기
                parts = raw_line.split(',')
                
                # 무결성 체크: 데이터 개수가 정확히 6개이고, 시작('S')과 끝('E') 마커가 완벽한지 검증
                if len(parts) == 6 and parts[0] == 'S' and parts[5] == 'E':
                    
                    # 문자열 데이터를 판단 레이어 연산용 실수(Float)로 형변환
                    front_dist = float(parts[1])
                    back_dist  = float(parts[2])
                    left_dist  = float(parts[3])
                    right_dist = float(parts[4])
                    
                    # ROS 2 표준 배열 메시지에 데이터 적재
                    msg = Float32MultiArray()
                    msg.data = [front_dist, back_dist, left_dist, right_dist]
                    
                    # 판단 레이어로 가공된 토픽 발행 (Publish)
                    self.distance_pub.publish(msg)
                    
                    # 모니터링용 디버그 로그 출력
                    self.get_logger().info(
                        f"정제 데이터 발행 중 -> [전: {front_dist:.1f}cm, 후: {back_dist:.1f}cm, 좌: {left_dist:.1f}cm, 우: {right_dist:.1f}cm]"
                    )
                else:
                    self.get_logger().warn("잘못된 패킷 구조 또는 데이터 누락 감지. 해당 패킷은 폐기합니다.")
                    
            except ValueError:
                # 순간적인 문자열 깨짐으로 인해 float() 변환 실패 시 노드 다운 방지
                self.get_logger().warn("수신된 데이터에 문자 깨짐(노이즈)이 있어 파싱을 스킵합니다.")
            except Exception as e:
                self.get_logger().error(f"시리얼 통신 처리 중 예외 발생: {e}")

    def destroy_node(self):
        # 노드 종료 시 안전하게 시리얼 포트를 닫아줍니다.
        if hasattr(self, 'ser') and self.ser.is_open:
            self.ser.close()
            self.get_logger().info("아두이노 시리얼 포트가 안전하게 닫혔습니다.")
        super().destroy_node()

def main(args=None):
    rclpy.init(args=args)
    node = SensorFilterNode()
    try:
        rclpy.spin(node)
    except KeyboardInterrupt:
        node.get_logger().info("사용자에 의해 노드가 종료되었습니다.")
    finally:
        node.destroy_node()
        rclpy.shutdown()

if __name__ == '__main__':
    main()
```

