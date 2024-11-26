#!/bin/bash

CENTOS_CONTAINER="centos7"
UBUNTU_CONTAINER="ubuntu"
FEDORA_CONTAINER="fedora"


start_containers() {
    docker run -d --name $CENTOS_CONTAINER centos:7 tail -f /dev/null
    
    docker run -d --name $UBUNTU_CONTAINER ubuntu:24.04 tail -f /dev/null
    docker exec $UBUNTU_CONTAINER apt update 
    docker exec $UBUNTU_CONTAINER apt install python3 -y
    
    docker run -d --name $FEDORA_CONTAINER pycontribs/fedora tail -f /dev/null
}

stop_containers() {
    docker stop $CENTOS_CONTAINER && docker rm $CENTOS_CONTAINER
    docker stop $UBUNTU_CONTAINER && docker rm $UBUNTU_CONTAINER
    docker stop $FEDORA_CONTAINER && docker rm $FEDORA_CONTAINER
}

run_ansible_playbook() {
    ansible-playbook -i inventory/prod.yml site.yml --ask-vault-pass
}

if [ "$1" == "start" ]; then
    start_containers
elif [ "$1" == "stop" ]; then
    stop_containers
elif [ "$1" == "ansible" ]; then
    run_ansible_playbook
else
    echo "Использование: $0 {start|ansible|stop}"
    exit 1
fi
