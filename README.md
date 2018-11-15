# packer-aws-beats

Packer based project for provisioning a "beats" image with Elastic Beats,
using Ansible remote, and Serverspc, for AWS, or Virtualbox.

## Requirements

To use this project, you must have installed:
- [Packer](https://www.packer.io/downloads.html)
- [Ansible](http://docs.ansible.com/ansible/latest/intro_installation.html)
- [Serverspec](http://serverspec.org/)
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/installing.html)
- [jq](https://stedolan.github.io/jq/)

(Optional)
- [Virtualbox](https://www.virtualbox.org/wiki/Downloads)
- [Vagrant](https://www.vagrantup.com/downloads.html)

## Deploy to AWS, with Packer
```shell
git clone https://github.com/apolloclark/packer-aws-beats
cd ./packer-aws-beats/base
# create a keypair named "packer" or change lines 26, 27 in build_packer_aws.sh
./build_packer_aws.sh
```

## Deploy to Virtualbox, with Packer
```shell
git clone https://github.com/apolloclark/packer-aws-beats
cd ./packer-aws-beats/base
./build_packer_virtualbox.sh
```

## Deploy to Virtualbox, with Vagrant
```shell
git clone https://github.com/apolloclark/packer-aws-beats
cd ./packer-aws-beats/base
vagrant up
vagrant ssh
```

## Ansible Roles

Ansible Roles:
- [geerlingguy.firewall](https://github.com/geerlingguy/ansible-role-firewall)
- [geerlingguy.git](https://github.com/geerlingguy/ansible-role-git)
- [apolloclark.nano-highlighting](https://github.com/apolloclark/ansible-role-nano-highlighting)
- [apolloclark.osquery](https://github.com/apolloclark/ansible-role-osquery)
- [apolloclark.filebeat](https://github.com/apolloclark/ansible-role-filebeat)
- [apolloclark.metricbeat](https://github.com/apolloclark/ansible-role-metricbeat)
- [apolloclark.heartbeat](https://github.com/apolloclark/ansible-role-heartbeat)
- [apolloclark.packetbeat](https://github.com/apolloclark/ansible-role-packetbeat)
- [apolloclark.auditbeat](https://github.com/apolloclark/ansible-role-auditbeat)
