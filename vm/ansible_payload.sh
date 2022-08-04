#!/bin/bash

apt  update -y
apt install -y python3-pip
pip3 install ansible
ansible-galaxy collection install azure.azcollection
pip3 install -r ~/.ansible/collections/ansible_collections/azure/azcollection/requirements-azure.txt

source env_vars.sh
mkdir ~/.azure
cat > ~/.azure/credentials << EOF
[default]
subscription_id=$TF_VAR_azure_subscription_id
client_id=$TF_VAR_azure_client_id
secret=$TF_VAR_azure_secret
tenant=$TF_VAR_azure_tenant
EOF

git clone https://github.com/korsakjakub/terraform-ansible-bsf-test
cd terraform-ansible-bsf-test/vm/ansible
ssh-keygen -q -t rsa -N '' -f ~/.ssh/id_rsa <<<y >/dev/null 2>&1
ansible-playbook create_azure_vm.yaml
ansible-galaxy install geerlingguy.mysql
ansible-playbook -i inventory create_mysql.yaml
