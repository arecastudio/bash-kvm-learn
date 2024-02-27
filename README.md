# bash-terraform-learn
Practical Terraform combined with bash script

### Download Ubuntu cloud image from its official repo
```
$ curl -O 'https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img' -H'Referer: https://cloud-images.ubuntu.com/'
```

### Run command
Generate VM
```
$ chmod u+x *.sh
$ ./autogenerate.sh $RANDOM
```

Destroy (stop) and remove VM
```
$ ./destroyall.sh
```
