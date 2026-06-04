#!/usr/bin/env python3
"""
경로 PNG 저장(_save_path_png) 단독 테스트.
하드웨어(STM32/라이다) 없이 합성 맵+경로로 실제 렌더링 함수를 호출해
~/spas_ws/maps/path_<timestamp>.png 를 생성한다.

사용법:
  cd ~/spas_ws
  colcon build --packages-select spas_planning && source install/setup.bash
  python3 test_path_png.py
"""
import math
import numpy as np
import rclpy
from spas_planning.hybrid_A_star_node import HybridAStarNode


def main():
    rclpy.init()
    node = HybridAStarNode()

    # 합성 점유격자 80x80: 가운데 자유공간 + ㄷ자 벽(주차칸 흉내)
    h, w = 80, 80
    occ = np.full((h, w), -1, dtype=np.int8)   # -1 = 미탐색
    occ[15:65, 15:65] = 0                       # free
    occ[15, 15:65] = 100                        # top wall
    occ[64, 15:65] = 100                        # bottom wall
    occ[15:65, 15] = 100                        # left wall
    ox, oy, res = -2.0, -2.0, 0.05

    # 합성 경로(map 좌표, 살짝 곡선)
    path, x, y = [], -1.5, -1.5
    for i in range(40):
        yaw = 0.3 + 0.02 * i
        x += 0.04 * math.cos(yaw)
        y += 0.04 * math.sin(yaw)
        path.append((x, y, yaw))

    node._save_path_png(path, occ, ox, oy, res,
                        start=(-1.5, -1.5, 0.3),
                        goal=(path[-1][0], path[-1][1], path[-1][2]))
    node.destroy_node()
    rclpy.shutdown()
    print("TEST DONE → ~/spas_ws/maps/path_*.png 확인")


if __name__ == '__main__':
    main()
