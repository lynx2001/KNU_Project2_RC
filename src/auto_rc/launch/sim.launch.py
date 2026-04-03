import os
from ament_index_python.packages import get_package_share_directory
from launch import LaunchDescription
from launch_ros.actions import Node
import xacro

def generate_launch_description():
    # 패키지 이름 설정 (폴더 이름에 맞게 수정 필요할 수 있음)
    pkg_name = 'Auto_RC'
    
    # xacro 파일 경로 가져오기
    xacro_file = os.path.join(get_package_share_directory(pkg_name), 'urdf', 'auto_rc.urdf.xacro')
    
    # xacro 파일을 파이썬 내부에서 파싱하여 XML 문자열로 변환
    robot_description_raw = xacro.process_file(xacro_file).toxml()

    # Robot State Publisher 노드 (로봇의 뼈대와 위치 정보를 브로드캐스트)
    node_robot_state_publisher = Node(
        package='robot_state_publisher',
        executable='robot_state_publisher',
        output='screen',
        parameters=[{'robot_description': robot_description_raw}]
    )

    # Joint State Publisher GUI 노드 (슬라이더로 조향각과 바퀴를 움직여볼 수 있는 창)
    node_joint_state_publisher_gui = Node(
        package='joint_state_publisher_gui',
        executable='joint_state_publisher_gui',
        output='screen'
    )

    # RViz2 노드 실행
    node_rviz = Node(
        package='rviz2',
        executable='rviz2',
        output='screen'
    )

    return LaunchDescription([
        node_robot_state_publisher,
        node_joint_state_publisher_gui,
        node_rviz
    ])