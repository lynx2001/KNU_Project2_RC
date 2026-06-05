# spas_bringup_launch.py


```python
x`import os
from ament_index_python.packages import get_package_share_directory
from launch import LaunchDescription
from launch.actions import IncludeLaunchDescription
from launch.launch_description_sources import PythonLaunchDescriptionSource
from launch_ros.actions import Node

def generate_launch_description():
    # 1. 기성품 오픈소스 패키지들의 설치 경로(Share 디렉토리) 가져오기
    sllidar_share = get_package_share_directory('sllidar_ros2')
    slam_toolbox_share = get_package_share_directory('slam_toolbox')

    # 2. 기성품 라이다 런치 파일 호출 설정 (sllidar_a1_launch.py)
    lidar_launch = IncludeLaunchDescription(
        PythonLaunchDescriptionSource(
            os.path.join(sllidar_share, 'launch', 'sllidar_a1_launch.py')
        )
    )

    # 3. 고정 TF 브로드캐스터 노드 설정: 차체(base_link) 정중앙 기준, 위로 10cm(Z=0.1)에 라이다가 달렸다고 선언
    static_tf_node = Node(
        package='tf2_ros',
        executable='static_transform_publisher',
        name='static_tf_pdw_laser',
        arguments=['--x', '0', '--y', '0', '--z', '0.1', '--frame-id', 'base_link', '--child-frame-id', 'laser']
    )

    # 4. 우리가 만든 [제어 레이어] STM32 브리지 노드 실행 설정
    stm32_bridge_node = Node(
        package='spas_control',
        executable='stm32_bridge_node',
        name='stm32_bridge_node',
        output='screen'
    )

    # 5. 우리가 만든 [인지 레이어] 아두이노 초음파 필터 노드 실행 설정
    sensor_filter_node = Node(
        package='spas_perception',
        executable='sensor_filter_node',
        name='sensor_filter_node',
        output='screen'
    )

    # 6. 우리가 만든 [판단 레이어] 긴급 제동 안전 감시 노드 실행 설정
    safety_node = Node(
        package='spas_planning',
        executable='safety_node',
        name='safety_node',
        output='screen'
    )

    # 7. 기성품 SLAM 툴박스 런치 파일 호출 설정 (online_async_launch.py)
    # 매니저님의 슬램 파라미터 파일 경로($HOME/spas_slam_params.yaml)를 동적으로 지정합니다.
    home_dir = os.path.expanduser('~')
    slam_params_path = os.path.join(home_dir, 'spas_slam_params.yaml')
    
    slam_launch = IncludeLaunchDescription(
        PythonLaunchDescriptionSource(
            os.path.join(slam_toolbox_share, 'launch', 'online_async_launch.py')
        ),
        launch_arguments={
            'slam_params_file': slam_params_path,
            'use_sim_time': 'false'
        }.items()
    )

    # 🚀 최종 실행할 노드 및 런치 파일들을 하나의 마스터 리스트로 묶어서 반환
    return LaunchDescription([
        lidar_launch,       # 1. 라이다 켜기
        static_tf_node,     # 2. 라이다 높이(TF) 등록
        stm32_bridge_node,  # 3. STM32 통신 및 /odom 연산 시작
        sensor_filter_node, # 4. 아두이노 초음파 데이터 파싱 시작
        safety_node,        # 5. 긴급 제동 감시 브레인 가동
        slam_launch         # 6. 실시간 지도(SLAM) 작성 시작
    ])
```


수정 전 0604


```c++
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

    # 2. 기성품 라이다 드라이버 런치 파일 호출 설정
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

    # 4. 슬램 툴박스 런치 파일 호출 설정 (기본 비동기 SLAM 켜기)
    slam_launch = IncludeLaunchDescription(
        PythonLaunchDescriptionSource(
            os.path.join(slam_toolbox_share, 'launch', 'online_async_launch.py')
        ),
        launch_arguments={
            'use_sim_time': 'false'
        }.items()
    )

    return LaunchDescription([
        # === 하드웨어 및 인프라 레이어 ===
        lidar_launch,       # 라이다 가동
        static_tf_node,     # 라이다-차체 신체 구조 등록
        slam_launch,        # 실시간 지도 생성(SLAM) 가동
        
        # 아두이노 초음파 센서 가동
        Node(
            package='spas_perception',
            executable='sensor_filter_node',
            name='sensor_filter_node',
            output='screen'
        ),

        # === 브레인 판단 레이어 (Planning) ===
        # 안전 감시 노드
        Node(
            package='spas_planning',
            executable='safety_node',
            name='safety_node',
            output='screen'
        ),
        # 공간 인식 노드 (진짜 슬램 맵을 바라보게 됨!)
        Node(
            package='spas_planning',
            executable='parking_space_detector',
            name='parking_space_detector',
            output='screen'
        ),
        # 하이브리드 A* 플래너 노드
        Node(
            package='spas_planning',
            executable='hybrid_A_star_node',
            name='hybrid_A_star_node',
            output='screen'
        ),
        # 차량 제어 노드
        Node(
            package='spas_planning',
            executable='vehicle_control_node',
            name='vehicle_control_node',
            output='screen'
        ),

        # === 하드웨어 제어 레이어 (Control) ===
        # STM32 브리지 노드: /cmd_vel 수신 → STM32 송신, 엔코더 피드백 → /odom + odom→base_link TF
        # ⚠️ 활성화 시 odom→base_link 동적 TF 를 발행하므로 base_link 를 고정하는
        #    static TF 가 다른 곳에 있으면 충돌함. STM32 보드 연결 후 주석 해제.
        # Node(
        #     package='spas_control',
        #     executable='stm32_bridge_node',
        #     name='stm32_bridge_node',
        #     output='screen'
        # ),
    ])
```

