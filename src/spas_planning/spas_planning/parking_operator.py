#!/usr/bin/env python3
"""
SPAS Parking Operator Node  ―  Y/N 키보드 조작 노드
=====================================================

hybrid_A_star_node 가 주차 공간을 찾아 WAITING 상태가 되면 /parking_waiting
토픽으로 대상 정보를 발행한다. 이 노드는 그 신호를 받아 터미널에 Y/N
프롬프트를 띄우고, 입력 결과를 /parking_start(Bool) 로 발행한다.

플래너(hybrid_A_star_node)는 launch 안에 그대로 두고, 이 노드만 자체
터미널에서 단독 실행하면 Y/N 키보드 입력을 그대로 쓸 수 있다.
  ros2 run spas_planning parking_operator

【구독】 /parking_waiting (String/JSON)  비어있으면 대기 공간 없음(프롬프트 닫힘)
【발행】 /parking_start   (Bool)         True=주차 시작 / False=취소
"""

import json
import threading
import time

import rclpy
from rclpy.node import Node
from rclpy.qos import DurabilityPolicy, QoSProfile
from std_msgs.msg import Bool, String


class ParkingOperatorNode(Node):
    def __init__(self):
        super().__init__('parking_operator')

        # 플래너의 /parking_waiting 은 transient_local(래치)로 발행되므로
        # 이 노드가 늦게 떠도 마지막 상태를 받도록 동일 QoS 로 구독한다.
        latched_qos = QoSProfile(depth=1, durability=DurabilityPolicy.TRANSIENT_LOCAL)
        self.create_subscription(String, '/parking_waiting', self._cb_waiting, latched_qos)
        self._pub_start = self.create_publisher(Bool, '/parking_start', 10)

        self._lock         = threading.Lock()
        self._waiting_info = None   # dict(대상 정보) 또는 None
        self._waiting_seq  = 0      # WAITING 진입마다 증가 → 중복/지연 프롬프트 구분

        threading.Thread(target=self._prompt_loop, daemon=True).start()
        self.get_logger().info(
            'parking_operator 시작. 주차 공간 발견 시 이 터미널에서 Y/N 를 입력하세요.'
        )

    # ── /parking_waiting 콜백 ─────────────────────────────────────────
    def _cb_waiting(self, msg: String):
        data = msg.data.strip()
        with self._lock:
            if data:
                try:
                    self._waiting_info = json.loads(data)
                except json.JSONDecodeError:
                    self._waiting_info = {}
                self._waiting_seq += 1
            else:
                # WAITING 이탈 → 프롬프트 닫힘 표시
                self._waiting_info = None

    # ── Y/N 프롬프트 루프 (별도 스레드, input 블로킹) ─────────────────
    def _prompt_loop(self):
        handled_seq = -1
        while rclpy.ok():
            with self._lock:
                info = self._waiting_info
                seq  = self._waiting_seq

            # 대기 공간이 없거나 이미 처리한 세션이면 쉬어간다.
            if info is None or seq == handled_seq:
                time.sleep(0.2)
                continue

            mx    = info.get('mx')
            my    = info.get('my')
            ptype = info.get('type', '?')
            try:
                ans = input(
                    f'\n[주차 공간 발견] 목표: ({mx}, {my})  [{ptype}]\n'
                    '>>> 자율 주차를 시작하시겠습니까? (Y/N): '
                ).strip().upper()
            except EOFError:
                self.get_logger().error(
                    'stdin(TTY)이 없어 키보드 입력을 받을 수 없습니다. '
                    '이 노드는 ros2 run 으로 단독 실행해야 합니다.'
                )
                time.sleep(1.0)
                continue

            # 입력하는 동안 상태가 바뀌었으면(다른 경로로 시작/취소) 무시.
            with self._lock:
                still_waiting = (self._waiting_info is not None
                                 and self._waiting_seq == seq)
            if not still_waiting:
                print('상태가 변경되어 입력을 무시합니다.')
                handled_seq = seq
                continue

            if ans == 'Y':
                self._publish(True)
                print('▶ 주차 시작 명령을 전송했습니다.')
                handled_seq = seq
            elif ans == 'N':
                self._publish(False)
                print('■ 주차 취소 명령을 전송했습니다.')
                handled_seq = seq
            else:
                print('Y 또는 N 만 입력하세요.')
                # handled_seq 갱신 안 함 → 같은 세션을 다시 프롬프트

    def _publish(self, decision: bool):
        msg = Bool()
        msg.data = decision
        self._pub_start.publish(msg)


def main(args=None):
    rclpy.init(args=args)
    node = ParkingOperatorNode()
    try:
        rclpy.spin(node)
    except KeyboardInterrupt:
        pass
    finally:
        node.destroy_node()
        rclpy.shutdown()


if __name__ == '__main__':
    main()
