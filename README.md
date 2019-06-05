# ocp3.11-all-in-one
OCP 3.11 all-in-one inventory and scripts files

Based on the work done here https://blog.openshift.com/openshift-all-in-one-aio-for-labs-and-fun/  by Willian Caban and using his AIO template as a reference. https://github.com/williamcaban/openshift-lab.git

This inventory and scripts builds a all-in-one OCP cluster on a single system, so one master, one node, one etcd all colocated.

Storage is provided via NFS, again colocated on the single system and created by running pv.sh

DNS is provided by a free dynamic DNS service dynu.com. This holds a wilcard A record mapping *.apps.<host>.dynu.net to the single system and also a fixed (non-wild card) record to <host>.dynu.net eg:
  
![alt text](https://github.com/alexgroom/ocp3.11-all-in-one/blob/master/dynu.png)

This all installs on RHEL 7.6. Scripts enclosed to add repos etc.

Resolv.conf gets setup wrongly updated by NetworkManager based on dynamic nature of network card, a corrected version is included. By default it assumes dynu.net is the search root which is wrong, since things don't start until <host>.dynu.net. Failure to get this correct with result in apiserver failing to start or failing to access github due to peer certificates.
  
Swap space. Suggest for a single node/master system that re-enabling swap makes sense since there is no alternate node to load balance pods across to. Edit /etc/fstab to re-enable swap that the OCP install disables. With an SSD disk on a single system this is probably better use of local resources than denying service to a pod.
