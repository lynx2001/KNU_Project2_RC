from setuptools import find_packages, setup

package_name = 'spas_planning'

setup(
    name=package_name,
    version='0.0.0',
    packages=find_packages(exclude=['test']),
    data_files=[
        ('share/ament_index/resource_index/packages',
            ['resource/' + package_name]),
        ('share/' + package_name, ['package.xml']),
    ],
    install_requires=['setuptools'],
    zip_safe=True,
    maintainer='ubuntu',
    maintainer_email='ubuntu@todo.todo',
    description='TODO: Package description',
    license='TODO: License declaration',
    extras_require={
        'test': [
            'pytest',
        ],
    },
    entry_points={
        'console_scripts': [
            'safety_node = spas_planning.safety_node:main',
            'hybrid_A_star_node = spas_planning.hybrid_A_star_node:main',
            'parking_space_detector = spas_planning.parking_space_detector:main',
            'vehicle_control_node = spas_planning.vehicle_control_node:main',
            'parking_operator = spas_planning.parking_operator:main',
        ],
    },
)
