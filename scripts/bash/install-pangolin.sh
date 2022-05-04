
\

# 1. KEEP UBUNTU OR DEBIAN UP TO DATE

sudo apt-get -y update
# sudo apt-get -y upgrade       # Uncomment to install new versions of packages currently installed
# sudo apt-get -y dist-upgrade  # Uncomment to handle changing dependencies with new vers. of pack.
# sudo apt-get -y autoremove    # Uncomment to remove packages that are now no longer needed


# 2. INSTALL THE DEPENDENCIES
sudo apt-get install libglew-dev libeigen3-dev
sudo apt-get install cmake  
sudo apt-get install libboost-dev libboost-thread-dev libboost-filesystem-dev

# 3. INSTALL THE LIBRARY
git clone https://github.com/stevenlovegrove/Pangolin.git

# 4. make and install
cd Pangolin  
mkdir build  
cd build  
cmake ..  
make -j4

sudo make install
sudo ldconfig


