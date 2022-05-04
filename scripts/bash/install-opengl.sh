# openGL

# 1. KEEP UBUNTU OR DEBIAN UP TO DATE

sudo apt-get -y update
sudo apt-get -y upgrade       # Uncomment to install new versions of packages currently installed
sudo apt-get -y dist-upgrade  # Uncomment to handle changing dependencies with new vers. of pack.
sudo apt-get -y autoremove    # Uncomment to remove packages that are now no longer needed

sudo apt-get install -y libgl1-mesa-dev
sudo apt-get install -y libglew-dev libsdl2-dev libsdl2-image-dev libglm-dev libfreetype6-dev
sudo apt-get install -y libglfw3-dev libglfw3

# OpenGL核心库，GL

sudo apt-get install libgl1-mesa-dev

# OpenGL实用函数库，GLU

sudo apt-get install libglu1-mesa-dev

# OpenGL实用工具包，GLUT

sudo apt-get install libglut-dev

glxinfo | grep OpenGL