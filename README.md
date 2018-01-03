# packer-aws-base

Packer based demo of provisioning a base image using Ansible, for AWS, with Elastic monitoring.

## Deploy Locally, with Vagrant
```shell
git clone https://github.com/apolloclark/packer-aws-base
vagrant up
vagrant ssh
```

## Deploy Locally, with Packer
```shell
git clone https://github.com/apolloclark/packer-aws-base
# change line 6 in build_packer_virtualbox.sh
./build_packer_virtualbox.sh
```

## Deploy to AWS
```shell
git clone https://github.com/apolloclark/packer-aws-base
./build_packer_aws.sh
```

## Ansible

Ansible Roles:
- geerlingguy.firewall
- geerlingguy.ntp
- geerlingguy.git
- apolloclark.osquery
- apolloclark.filebeat
- apolloclark.metricbeat
- apolloclark.heartbeat
- apolloclark.packetbeat
