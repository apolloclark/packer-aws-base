# packer-aws-base

Packer based demo of provisioning a base image using Ansible, for AWS, with Elastic monitoring.

## Deploy Locally
```shell
git clone https://github.com/apolloclark/packer-aws-base
vagrant up
vagrant ssh
```

## Deploy to AWS
```shell
git clone https://github.com/apolloclark/packer-aws-webapp
./build_packer.sh
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
