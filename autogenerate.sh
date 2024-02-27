#!/usr/bin/bash

if [[ $# -eq 0 ]] ; then
    echo 'some message'
    exit 1
fi

echo $1

name=$1
printf "instance-id: $name\nlocal-hostname: $name\n" > $name-meta-data
genisoimage -output $name-cidata.iso -V cidata -r -J user-data $name-meta-data


qemu-img create -b jammy-server-cloudimg-amd64.img -f qcow2 -F qcow2 $name.img 20G

virt-install --name=$name --ram=1024 --vcpus=1 --import --disk path=$name.img,format=qcow2 --disk path=$name-cidata.iso,device=cdrom --os-variant=ubuntu22.04 --network bridge=virbr0,model=virtio --graphics vnc,listen=0.0.0.0 --noautoconsole

virsh net-dhcp-leases default
