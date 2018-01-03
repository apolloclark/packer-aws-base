# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

    # Ubuntu 16.04 Xenial LTS 64-bit
    config.vm.box = "apolloclark/ubuntu1604-64"

    # VirtualBox Provider-specific configuration
    config.vm.provider "virtualbox" do |vb, override|

        # set the VM name
        vb.name = "packer-aws-base"

        # set the CPU, memory, graphics
        # @see https://www.virtualbox.org/manual/ch08.html
        vb.cpus = 1
        vb.memory = "1024"
        vb.gui = false

        # Share a folder to the guest VM, types: docker, nfs, rsync, smb, virtualbox
        # Windows supports: smb
        # Mac supports: rsync, nfs
        # override.vm.synced_folder host_folder.to_s, guest_folder.to_s, type: "smb"
        override.vm.synced_folder "./ansible", "/vagrant"

        # setup local apt-get cache
        if Vagrant.has_plugin?("vagrant-cachier")
            # Configure cached packages to be shared between instances of the same base box.
            # https://github.com/fgrehm/vagrant-cachier
            # More info on the "Usage" link above
            override.cache.scope = :box
        end
    end
      
    # Configure the box with Ansible, running within the Guest Machine
    # https://www.vagrantup.com/docs/provisioning/ansible.html
    # https://www.vagrantup.com/docs/provisioning/ansible_common.html
    # https://www.vagrantup.com/docs/provisioning/ansible_local.html
    config.vm.provision "ansible_local" do |ansible|
        ansible.provisioning_path = "/vagrant"
        ansible.galaxy_role_file = "requirements.yml"
        ansible.playbook = "playbook.yml"
        # ansible.extra_vars = "vars.yml"
        # ansible.verbose = true
    end
    
    # Verify the components are installed and running
    # https://github.com/vvchik/vagrant-serverspec
    config.vm.provision "serverspec" do |spec|
      
        # pattern for specfiles to search
        spec.pattern = 'spec/*/*_spec.rb'
        
        # this plugin uses it's own custom Rakefile, but will reuse any existing
        # spec_helper.rb script
    end
end
