
# foo old UID: 1005
# foo new UID: 2005
# foo old GID: 2000
# foo new GID: 3000

usrname="lz"
o_uid=1000
o_gid=1000
n_uid=1026
n_gid=1000


usermod -u $n_uid $usrname
groupmod -g $n_gid $usrname


# edit other files

sudo find / -user $o_uid -exec chown -h $usrname {} \;
sudo find / -group $o_gid -exec chgrp -h $usrname {} \;