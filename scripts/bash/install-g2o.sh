git clone https://github.com/RainerKuemmerle/g2o.git

sudo apt-get install libeigen3-dev

sudo apt-get install libsuitesparse-dev qtdeclarative5-dev qt5-qmake
sudo apt-get install libqglviewer-dev-qt5

sudo apt-get install libqglviewer-dev



cd g2o
mkdir build
cd build
cmake ..
make
sudo make install


sudo gedit /etc/ld.so.conf

# 加上

# include /usr/local/lib

# 最后执行

# ldconfig
