#!/bin/bash

vagrant box add --provider libvirt --name centos/8 https://cloud.centos.org/centos/8/x86_64/images/CentOS-8-Vagrant-8.1.1911-20200113.3.x86_64.vagrant-libvirt.box

retries=0
until [ $retries -ge 5 ]
do
  echo "Attempting to start VMs. Attempts: $retries"
  timeout 10m time vagrant up "$@" && break
  retries=$[$retries+1]
  sleep 5
done

sleep 10