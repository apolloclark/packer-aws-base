# packer-aws-base

Packer based project for provisioning a base image using Ansible and Serverspc,
for AWS, or Virtualbox, with Elastic monitoring.

## Requirements

To use this project, you must have installed:
- [Packer](https://www.packer.io/downloads.html)
- [Ansible](http://docs.ansible.com/ansible/latest/intro_installation.html)
- [Serverspec](http://serverspec.org/)
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/installing.html)

(Optional)
- [Virtualbox](https://www.virtualbox.org/wiki/Downloads)
- [Vagrant](https://www.vagrantup.com/downloads.html)

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

## Deploy Locally, with Vagrant
```shell
git clone https://github.com/apolloclark/packer-aws-base
vagrant up
vagrant ssh
```

## Ansible Roles

Ansible Roles:
- geerlingguy.firewall
- geerlingguy.git
- apolloclark.osquery
- apolloclark.filebeat
- apolloclark.metricbeat
- apolloclark.heartbeat
- apolloclark.packetbeat
