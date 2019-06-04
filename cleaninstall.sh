#!/bin/bash
echo "**************** uninstalling **********************************************"
echo "****************"
echo "****************"
#ansible-playbook -i inventorywc.ini /usr/share/ansible/openshift-ansible/playbooks/adhoc/uninstall.yml
echo "**************** PREREQUISITES **********************************************"
echo "****************"
echo "****************"
ansible-playbook -i inventorywc.ini /usr/share/ansible/openshift-ansible/playbooks/prerequisites.yml
echo "**************** DEPLOY CLUSTER **********************************************"
echo "****************"
echo "****************"
ansible-playbook -i inventorywc.ini /usr/share/ansible/openshift-ansible/playbooks/deploy_cluster.yml

