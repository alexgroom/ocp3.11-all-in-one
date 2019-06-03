# ocp3.11-all-in-one
OCP 3.11 all-in-one inventory and scripts files

Based on the work done here https://blog.openshift.com/openshift-all-in-one-aio-for-labs-and-fun/  by Willian Caban and using his AIO template as a reference. https://github.com/williamcaban/openshift-lab.git

This inventory and scripts builds a all-in-one OCP cluster on a single system, so one master, one node, one etcd all colocated.

Storage is provided via NFS, again colocated on the single system.

DNS is provided by a free dynamic DNS service dynu.com. This holds a wilcard A record mapping *.<host>.dynu.net to the single system.
  
![alt text](https://github.com/alexgroom/ocp3.11-all-in-one/blob/master/dynu.png)

This all installs on RHEL 7.6. Scripts enclosed to add repos etc.

Bugs:

Strange issue found while trying to start kube-catalog service. The apiserver fails making a reference to <HOST>.dynu.net:2379 which then mystically maps to the following IP: 5.199.182.31.
Reverse lookup on that address returns Telenet in Söflingen, Germany!!

Fixed this by patching the iptables to route this IP back to the host IP
