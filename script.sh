#!/bin/bash
# step 1 - prepare VM with ansible and terraform
# step 2 - run terraform code
# step 3 - get IP and update inventory file
# step 4 - run ansible

function prepare_vm() {
    sudo apt update
    sudo apt install ansible -y
    if [ ! -f /usr/share/keyrings/hashicorp-archive-keyring.gpg ]
    then
    wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
    fi
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
    sudo apt update && sudo apt install terraform packer -y
}

function build_ami() {
    cd packer || exit
    packer init .
    packer build sonarqube.pkr.hcl
}

function create_ec2() {
    cd terraform/dev || exit
    terraform init
    terraform apply -auto-approve
}

# function update_ip() {
#     terraform output -raw ec2 > ../ansible/hosts
# }

function update_ip() {
    HOST=$(terraform output -raw ec2)
    cat > ../ansible/hosts <<EOF
[sonarqube]
$HOST
EOF
    echo "Inventory updated:"
    cat ../ansible/hosts
}

function install_apps() {
    cd ../ansible || exit
    ansible-playbook main.yml
}

prepare_vm
build_ami
create_ec2
update_ip
echo "Waiting 20 sec"
sleep 20
install_apps
