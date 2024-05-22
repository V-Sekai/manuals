# Proposed: Test Google Mediapipe

## Context and Problem Statement

We're unable to test media pipe for iris.

## Describe the proposed option and how it helps to overcome the problem or limitation

Setup github actions so we can package mediapipe to demo iris tracking.

## Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

1. setup cicd for linux to media pipe
2. setup cid for media pipe iris tracking
3. create win10 support

#### Get video for linux info (optional)

```bash
sudo apt install v4l-utils -y
v4l2-ctl --all
```

#### Realsense Camera (optional)

```
sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade
git clone https://github.com/IntelRealSense/librealsense.git
cd librealsense
sudo apt-get install git libssl-dev libusb-1.0-0-dev pkg-config libgtk-3-dev -y
sudo apt-get install libglfw3-dev libgl1-mesa-dev libglu1-mesa-dev -y
./scripts/setup_udev_rules.sh
# Use Postos 21.04 NVIDIA
mkdir build && cd build
cmake ../ -DBUILD_EXAMPLES=true -DCMAKE_BUILD_TYPE=Release
sudo make uninstall && make clean && make && sudo make install -j`nproc`
```

# Reconnect the Intel RealSense depth camera and run: realsense-viewer to verify the installation.

#### Hello World in C++

```bash
sudo apt install apt-transport-https curl gnupg -y
curl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor > bazel.gpg
sudo mv bazel.gpg /etc/apt/trusted.gpg.d/
echo "deb [arch=amd64] https://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list
sudo apt update && sudo apt install bazel-3.7.2 -y
git clone https://github.com/google/mediapipe.git
cd mediapipe

sudo apt install python-is-python3 -y

export GLOG_logtostderr=1
# Need bazel flag 'MEDIAPIPE_DISABLE_GPU=1' as desktop GPU is not supported currently.
bazel-3.7.2 run --define MEDIAPIPE_DISABLE_GPU=1 \
    mediapipe/examples/desktop/hello_world:hello_world
chmod +x setup_opencv.sh && ./setup_opencv.sh
bazel-3.7.2 build --define MEDIAPIPE_DISABLE_GPU=1 mediapipe/examples/desktop/iris_tracking:iris_tracking_cpu
# Ensure a webcam is plugged in.
./bazel-bin/mediapipe/examples/desktop/iris_tracking/iris_tracking_cpu --calculator_graph_config_file=./mediapipe/graphs/iris_tracking/iris_tracking_cpu.pbtxt
```

### Alternative instructions for realsense

```bash
./bazel-bin/mediapipe/examples/desktop/iris_tracking/iris_tracking_cpu --calculator_graph_config_file=./mediapipe/graphs/iris_tracking/iris_tracking_cpu.pbtxt --input_video_path=/dev/video6
```

### create win10 support

Teach bazel llvm-mingw support.

## Positive Consequences <!-- optional -->

Able to mocap faces.

Able to use the human body as vr controllers.

## Negative Consequences <!-- optional -->

_No response_

## If this enhancement will not be used often, can it be worked around with a few lines of script?

Pose estimation is interesting and we have someone who wants to collaborate.

## Is there a reason why this should be core and done by us?

_No response_

## References <!-- optional -->

- https://google.github.io/mediapipe/getting_started/hello_world_cpp.html
- https://google.github.io/mediapipe/getting_started/cpp.html
- https://google.github.io/mediapipe/solutions/iris.html
- https://github.com/google/mediapipe/issues/1530
- https://github.com/V-Sekai/mediapipe

## Derivative License

Copyright (c) 2020-2021 V-Sekai contributors.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
