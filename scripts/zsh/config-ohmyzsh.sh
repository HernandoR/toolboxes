
# sudo apt -y install zsh

# chsh -s /usr/bin/zsh

# chmod +x ../sources/install-oh-my-zsh.sh
# ../sources/install-oh-my-zsh.sh

echo "copy cnfig"

cp ../sources/.zshrc ~/.zshrc

mv ~/.oh-my-zsh/custom ~/.oh-my-zsh/custom.bkp

cp -r ../sources/oh-my-zsh/custom ~/.oh-my-zsh/custom


# unfinished
#exit 1

# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# un comment below for china
#git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k