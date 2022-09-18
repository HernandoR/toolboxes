
# -b           run install in batch mode (without manual intervention),
#              it is expected the license terms are agreed upon
# -f           no error if install prefix already exists
# -h           print this help message and exit
# -p PREFIX    install prefix, defaults to /root/miniconda3, must not contain spaces.
# -s           skip running pre/post-link/install scripts
# -u           update an existing installation
# -t           run package tests after installation (may install conda-build)


mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh
~/miniconda3/bin/conda init bash
~/miniconda3/bin/conda init zsh

