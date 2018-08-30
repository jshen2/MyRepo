mkfs.xfs -L repo -n ftype=1 /dev/xvdc
echo "/dev/xvdc  /u01/data xfs defaults,noatime,nodiratime,nosuid,nodev,nobarrier,logbufs=8,logbsize=256k,allocsize=64m 1 1">> /etc/fstab
mkdir -p /u01/data
mount /u01/data
mkdir -p /u01/data/docker
yum install --enablerepo=ol7_addons -y docker-engine nfs-utils
yum update -y
systemctl enable docker
systemctl start docker
echo "vm.max_map_count=262144" >> /etc/sysctl.conf
usermod -G docker -a opc
