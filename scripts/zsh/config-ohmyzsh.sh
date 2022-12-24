# if havent install zsh, install it first
if ! command -v zsh &> /dev/null
then
    echo "zsh could not be found"
    echo "installing zsh"
    sudo apt -y install zsh
fi

# chsh -s /usr/bin/zsh

# check if the hostmachine can curl to github
isInChina=$(curl -Is https://github.com | head -n 1 | grep "200 OK" | grep "China")
if $isInChina; then
    echo "github is reachable"
    
else
    echo "github is not reachable"
    echo "Using local scripts / gitee ."
fi

# read the script's directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
DotFilesDir=DIR/../dotfiles

echo "update submodules"
git submodule init
git submodule update

# check if oh-my-zsh is installed
if [ -d ~/.oh-my-zsh ]; then
    echo "oh-my-zsh is already installed"
else
    echo "oh-my-zsh is not installed"
    echo "installing oh-my-zsh"
    if $isInChina; then
        echo "installing oh-my-zsh from gitee"
        sh -c "$(curl -fsSL https://gitee.com/mirrors/oh-my-zsh/raw/master/tools/install.sh)"
    else
        echo "installing oh-my-zsh from github"
        sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    fi
fi



# install powerlevel10k, zsh-autosuggestions, zsh-syntax-highlighting
echo "installing powerlevel10k and zsh-autosuggestions and zsh-syntax-highlighting"
if $isInChina; then
    echo "installing powerlevel10k zsh-autosuggestions, zsh-syntax-highlighting from gitee"
    git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    git clone https://gitee.com/githubClone/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://gitee.com/yuxiaoxi/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
else
    echo "installing powerlevel10k zsh-autosuggestions, zsh-syntax-highlighting from github"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions 
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

fi

# copy the config file
echo "copying config"
mv ~/.zshrc ~/.zshrc.bkp
cp $DotFilesDir/.zshrc ~/.zshrc

if ${setp10k:-true}; then
    echo "copying p10k config"
    mv ~/.p10k.zsh ~/.p10k.zsh.bkp
    cp $DotFilesDir/zsh_plugins/.p10k.zsh ~/.p10k.zsh
    # install powerline fonts
    echo "PLZ set font to fira powerline in terminal"
fi


# echo "seting hardware timezone to loacl"

# timedatectl set-local-rtc 1 --adjust-system-clock

# echo "copying config"

# cp ../sources/.zshrc ~/.zshrc

# mv ~/.oh-my-zsh/custom ~/.oh-my-zsh/custom.bkp

# cp -r ../sources/oh-my-zsh/custom ~/.oh-my-zsh/custom


# unfinished
#exit 1

# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# un comment below for china
#git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k