
sudo apt-get -y update
sudo apt-get -y upgrade

sudo apt-get install nfs-common -y


mkdir -p ~/nfs/dev

showmount -e 192.168.31.126

# sudo mount -t nfs -o vers=4 192.168.31.126:/volume3/dev ~/nfs/dev
# sudo mount -t nfs -o vers=4 192.168.31.126:/volume2/docker ~/nfs/docker
# sudo mount -t nfs -o vers=4 192.168.31.126:/volume4/Videos ~/nfs/Videos

echo "192.168.31.126:/volume2/docker ~/nfs/docker nfs vers=4 0 0" > /etc/fstab
echo "192.168.31.126:/volume4/Videos ~/nfs/Videos nfs vers=4 0 0" > /etc/fstab


