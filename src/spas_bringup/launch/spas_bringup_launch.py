import os
from ament_index_python.packages import get_package_share_directory
from launch import LaunchDescription
from launch.actions import IncludeLaunchDescription
from launch.launch_description_sources import PythonLaunchDescriptionSource
from launch_ros.actions import Node

def generate_launch_description():
    # 1. 기성품 오픈소스 패키지들의 Share 경로 가져오기
    sllidar_share = get_package_share_directory('sllidar_ros2')
    slam_toolbox_share = get_package_share_directory('slam_toolbox')

    # 2. 기성품 라이다 드라이버 런치 파일 호출 설정 (RPLIDAR A1)
    lidar_launch = IncludeLaunchDescription(
        PythonLaunchDescriptionSource(
            os.path.join(sllidar_share, 'launch', 'sllidar_a1_launch.py')
        )
    )

    # 3. 고정 TF 브로드캐스터: 차체(base_link) 중심 기준, 위로 10cm(Z=0.1)에 라이다가 연결됨을 선언
    static_tf_node = Node(
        package='tf2_ros',
        executable='static_transform_publisher',
        name='static_tf_laser',
        arguments=['--x', '0', '--y', '0', '--z', '0.1', '--frame-id', 'base_link', '--child-frame-id', 'laser']
    )

    # 4. 슬램 툴박스 런치 파일 호출 설정 (실시간 지도 생성)
    slam_launch = IncludeLaunchDescription(
        PythonLaunchDescriptionSource(
            os.path.join(slam_toolbox_share, 'launch', 'online_async_launch.py')
        ),
        launch_arguments={
            'use_sim_time': 'false'
        }.items()
    )

    return LaunchDescription([
        # =====================================================================
        # 1. HARDWARE INTERFACE LAYER (실제 로봇 기기 통신부)
        # =====================================================================
        lidar_launch,       # ① 라이다 모터 회전 및 기동
        static_tf_node,     # ② 라이다-차체 신체 구조 등록
        slam_launch,        # ③ 실시간 지도 생성(SLAM) 가동
        
        # ④ 아두이노 초음파 센서 데이터 필터 노드
        Node(
            package='spas_perception',
            executable='sensor_filter_node',
            name='sensor_filter_node',
            output='screen'
        ),

        # ⑤ 🔥 [부활!] STM32 모터/조향 시리얼 브릿지 노드
        # 라즈베리파이 최하단에서 진짜 최종 모터 명령을 가로채 STM32 하드웨어로 전달합니다.
        # 대상: Hiwonder ROS Robot Control Board (STM32F407VET6), USB CDC → /dev/ttyACM0
        Node(
            package='spas_control',   # 🚨 패키지명이 spas_control인지 체크하세요!
            executable='stm32_bridge_node',
            name='stm32_bridge_node',
            output='screen',
            parameters=[{
                # CH9102(QinHeng 1a86:55d4) Hiwonder 보드의 안정 경로(by-id).
                # ttyACM0 는 USB 꽂는 순서에 따라 바뀔 수 있어 by-id 로 고정.
                'serial_port': '/dev/serial/by-id/usb-1a86_USB_Single_Serial_5B32012542-if00',
                'baud_rate':   1000000,   # Hiwonder 보드 통신속도(정품 SDK 기준)
            }]
        ),

        # =====================================================================
        # 2. BRAIN PLANNING LAYER (자율주행 인지/판단/제어 알고리즘 4대장)
        # =====================================================================
        # ⑥ 긴급 제동 및 안전 감시 브레인
        Node(
            package='spas_planning',
            executable='safety_node',
            name='safety_node',
            output='screen'
        ),
        # ⑦ 공간 인식 및 슬라이딩 윈도우 주차칸 검출 노드
        Node(
            package='spas_planning',
            executable='parking_space_detector',
            name='parking_space_detector',
            output='screen'
        ),
        # ⑧ 하이브리드 A* 전역 경로 플래너
        Node(
            package='spas_planning',
            executable='hybrid_A_star_node',
            name='hybrid_A_star_node',
            output='screen'
        ),
        # ⑨ Pure Pursuit 차량 추적 제어 노드
        Node(
            package='spas_planning',
            executable='vehicle_control_node',
            name='vehicle_control_node',
            output='screen'
        ),
    ])