#!/bin/bash
subscription-manager list --available --matches '*OpenShift*'
subscription-manager attach --pool=<>
subscription-manager repos --disable="*"
yum repolist
subscription-manager repos     --enable="rhel-7-server-rpms"     --enable="rhel-7-server-extras-rpms"     --enable="rhel-7-server-ose-3.11-rpms"     --enable="rhel-7-server-ansible-2.4-rpms"
yum install wget git net-tools bind-utils yum-utils iptables-services bridge-utils bash-completion kexec-tools sos psacct
yum update
#reboot
yum install atomic
yum install openshift-ansible
yum install docker-1.13.1
rpm -V docker-1.13.1
docker version
mkdir -p /root/htpasswd
touch /root/htpasswd
htpasswd -b /root/htpasswd developer developer
htpasswd -b /root/htpasswd admin admin
ssh-keygen
ssh-copy-id <host>
setsebool -P virt_use_nfs 1
systemctl restart nfs-server
#oc adm policy add-cluster-role-to-user cluster-admin admin
