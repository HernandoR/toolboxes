
git clone https://github.com/rmsalinas/DBow3.git #下载源文件
cd DBoW3 					#进入源文件夹
mkdir build 				#新建一个编译目标文件夹
cd build 					#将build作为make工作路径
cmake  .. 	#编译上一级目录，如果您提前安装好了contrib_modules，则使用cmake选项-DUSE_CONTRIB=ON使能SURF，否则直接运行cmake ..
make -j4 					#或者换为“-j8”甚至直接“make”，这取决于您的电脑的线程数量
sudo make install 			#安装DBoW3
