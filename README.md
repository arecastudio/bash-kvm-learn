# bash-kvm-learn
Practical libvirt to create `vm` and in `linux`

### Download Ubuntu cloud image from its official repo
```
$ curl -O 'https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img' -H'Referer: https://cloud-images.ubuntu.com/'
```

### Run command
Make sure the downloaded scripts are executable, then rename `example-user-data` to `user-data` and edit its content with your generated ssh key, `ed25519` is recommended for its simplicity.
```
$ chmod u+x *.sh
$ mv example-user-data user-data
$ cat ~/.ssh/id_ed25519.pub |awk '{print $2,$3}'|while read k h;do sed -i "s/blah-blah-blah/${k//\//\\/}/g" user-data;sed -i "s/host@user/$h/g" user-data;done
```
Generate with random id
```
$ ./autogenerate.sh $RANDOM
```
Check generated VM with its IP address
```
virsh net-dhcp-leases default
```

Destroy (stop) and remove VM
```
$ ./destroyall.sh
```
To clean up virual network leases, for example we use `virbr0` then replace the file content with empty array
```
$ echo "[]" > /var/lib/libvirt/dnsmasq/virbr0.status
```
