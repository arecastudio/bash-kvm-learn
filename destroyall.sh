#!/usr/bin/bash
ls *-cidata.iso 2>/dev/null|awk -F'-' '{print $1}'|while read vm;do ./autodestroy2.sh $vm;done


#echo "[]" > /var/lib/libvirt/dnsmasq/virbr0.status
