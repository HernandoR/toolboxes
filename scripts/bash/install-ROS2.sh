# install ROS2 according to the arch and os version
# detect the arch and os version

ROS2_DISTRO=galactic

if [ "$(uname -m)" = "x86_64" ]; then
    arch="amd64"
elif [ "$(uname -m)" = "aarch64" ]; then
    arch="arm64"
else
    echo "Unsupported architecture"
    exit 1
fi

if [ "$(lsb_release -rs)" = "18.04" ]; then
    os="bionic"
elif [ "$(lsb_release -rs)" = "20.04" ]; then
    os="focal"
else
    echo "Unsupported OS version"
    exit 1
fi

# check if ROS2 is already installed
if [ -d "/opt/ros/$ROS2_DISTRO" ]; then
    echo "ROS2 is already installed"
    exit 1
fi

# Check for utf-8 locale
if [ "$(locale charmap)" != "UTF-8" ]; then
    echo "Please set your locale to UTF-8 by:"
    echo "\t sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 && export LANG=en_US.UTF-8"
    exit 1
fi

# check the parameters with the user
echo "The following parameters will be used:"
echo "ROS2_DISTRO: $ROS2_DISTRO"
echo "arch: $arch"
echo "os: $os"
echo "Do you want to continue? [y/n]"
read -r answer
if [ "$answer" != "y" ]; then
    echo "Installation aborted"
    exit 1
fi

# install ROS2
sudo apt update
sudo apt install curl gnupg2 lsb-release
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
sudo sh -c 'echo "deb [arch='$arch'] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" > /etc/apt/sources.list.d/ros2-latest.list'


sudo apt update
sudo apt upgrade
sudo apt install ros-$ROS2_DISTRO-desktop
