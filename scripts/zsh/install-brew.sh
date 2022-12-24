# check if github is reachable
isInChina=$(curl -Is https://github.com | head -n 1 | grep "200 OK" | grep "China")
if $isInChina; then
    echo "github is reachable"
    # 也可从 GitHub 获取官方安装脚本安装 Homebrew / Linuxbrew
    /bin/bash -c "$(curl -fsSL https://github.com/Homebrew/install/raw/master/install.sh)"
    
else
    echo "github is not reachable"
    echo "Using local scripts / gitee ."
    # 从BFSU下载安装脚本并安装 Homebrew / Linuxbrew
    git clone --depth=1 https://mirrors.bfsu.edu.cn/git/homebrew/install.git brew-install
    /bin/bash brew-install/install.sh
    rm -rf brew-install
fi




