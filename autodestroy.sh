#!/usr/bin/bash

if [[ $# -eq 0 ]] ; then
    echo 'some message'
    exit 1
fi

echo $1

virsh destroy $1
virsh undefine $1 --remove-all-storage

rm -f $1-meta-data

#echo "[]" > /var/lib/libvirt/dnsmasq/virbr0.status
