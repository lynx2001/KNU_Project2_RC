# Pi Camera V2


```bash
# camera 확인
# CSI 케이블 연결됐는지 커널에서 인식하는지 확인
dmesg | grep -i camera
dmesg | grep -i imx219

cat /boot/firmware/config.txt | grep camera

sudo nano /boot/firmware/config.txt
camera_auto_detect=1

cam --list
v4l2-ctl --list-devices

# 의존성 설치
sudo apt install -y cmake ninja-build pkg-config \
  libyaml-dev python3-yaml python3-ply \
  libgnutls28-dev libtiff-dev \
  libboost-dev libglib2.0-dev \
  libdrm-dev libevent-dev \
  meson git
  
  
# 기존 구버전 제거
sudo apt remove -y libcamera-dev libcamera-tools
sudo apt autoremove -y

# 소스 클론
cd ~/Desktop
git clone https://git.libcamera.org/libcamera/libcamera.git
cd libcamera


# meson 최신 버전 PIP 설치
sudo apt remove -y meson
sudo pip3 install meson

meson --version

cd ~/Desktop/libcamera
rm -rf build
meson setup build

# meson 설정
cd ~/Desktop/libcamera
rm -rf build
meson setup build


which meson
# 또는
pip3 show meson | grep Location

export PATH=$PATH:/usr/local/bin
meson setup build

ninja -C build

sudo ninja -C build install
sudo ldconfig

# PATH 영구 등록
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
libcamera-hello --list-cameras

# libcamera-apps 빌드
cd ~/Desktop
sudo apt install -y libboost-program-options-dev \
  libexif-dev libjpeg-dev libpng-dev

git clone https://github.com/raspberrypi/libcamera-apps.git
cd libcamera-apps
mkdir build && cd build
cmake -DENABLE_DRM=1 -DENABLE_X11=1 -DENABLE_QT=0 -DENABLE_OPENCV=0 \
  -DENABLE_TFLITE=0 ..
make -j4
sudo make install

# libav 인코더, Qt 프리뷰 비활성화 후 빌드
cd ~/Desktop/libcamera-apps
meson setup build --wipe \
  -Denable_libav=disabled \
  -Denable_drm=enabled \
  -Denable_egl=disabled \
  -Denable_qt=disabled \
  -Denable_opencv=disabled \
  -Denable_tflite=disabled
ninja -C build
sudo ninja -C build install



# 이전 빌드 디렉토리 권한 문제 : 강제로 지우고 다시
sudo rm -rf ~/Desktop/libcamera-apps/build
cd ~/Desktop/libcamera-apps
meson setup build \
  -Denable_libav=disabled \
  -Denable_drm=enabled \
  -Denable_egl=disabled \
  -Denable_qt=disabled \
  -Denable_opencv=disabled \
  -Denable_tflite=disabled
ninja -C build
sudo ninja -C build install


# 사진 찍기
sudo ldconfig
rpicam-jpeg --output test.jpg

# 해상도 낮춰 사진 찍기
rpicam-jpeg --output test1.jpg --width 1640 --height 1232
```


```bash
# 터미널 1
rpicam-vid -t 0 --inline --listen -o tcp://0.0.0.0:8888 --width 640 --height 480 --nopreview

# 터미널 2
python3 *.py
```

