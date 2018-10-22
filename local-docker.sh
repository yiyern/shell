#!/usr/bin/env bash
sudo yum remove docker docker-common docker-selinux docker-engine
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
# sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
sudo yum clean all
sudo yum makecache fast
sudo yum install docker-ce -y
sudo mkdir -p /etc/docker
sudo cat > /etc/docker/daemon.json <<EOF
{
"registry-mirrors": ["https://registry.docker-cn.com","https://docker.mirrors.ustc.edu.cn","https://a5agyt8o.mirror.aliyuncs.com"]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker
sudo systemctl enable docker
