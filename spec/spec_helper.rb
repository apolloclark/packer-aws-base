require 'serverspec'
require 'net/ssh'
require 'tempfile'

set :backend, :ssh

if ENV['ASK_SUDO_PASSWORD']
  begin
    require 'highline/import'
  rescue LoadError
    fail "highline is not available. Try installing it."
  end
  set :sudo_password, ask("Enter sudo password: ") { |q| q.echo = false }
else
  set :sudo_password, ENV['SUDO_PASSWORD']
end



# retrieve the hostname
host = ENV['TARGET_HOST']
puts "host =  '#{host}'"



# check if a Vagrant machine is running
vagrant_status = `vagrant status`
if match = /running/.match(vagrant_status)
  puts "vagrant machine is running..."
  
  # check if this is a manual serverspec run
  vagrant_run = ENV['VAGRANT_INSTALLER_VERSION'] || 'none'
  if vagrant_run != "2"
    
    puts "manual serverspec run..."
    host = "default"
  
    # retrieve the vagrant ssh config
    config = Tempfile.new('', Dir.tmpdir)
    config.write(`vagrant ssh-config #{host}`)
    config.close
    
    # configure the SSH connection for serverspec
    options = Net::SSH::Config.for(host, [config.path])
    options[:user] ||= Etc.getlogin
    set :host,        options[:host_name] || host
    set :ssh_options, options
    # p options, host
  end
end



# check if this is a Packer run
packer_status = ENV['PACKER_RUN_UUID'] || 'none'
if packer_status != 'none'
  puts "packer run detected..."
  
  # retrieve the dynamic SSH port set by Packer in Virtualbox
  ssh_port=`vboxmanage showvminfo #{host} --machinereadable | grep "Forwarding"`
  ssh_port = ssh_port.split(',')
  ssh_port = ssh_port[3].to_i

  # set the host and hostname to local
  host = "127.0.0.1"

  # configure the SSH connection for serverspec
  options = Net::SSH::Config.for(host)
  options[:auth_methods]  = ['none','publickey','password']
  options[:host_name]     = host
  options[:user]          = "vagrant"
  options[:port]          = ssh_port
  options[:password]      = "vagrant"
  options[:user_known_hosts_file] = "/dev/null"
  options[:keys]          = [
    "~/.ssh/vagrant.pub",
    "~/.ssh/vagrant.pem"
  ]
  options[:keys_only]     = false

  set :host, host
  set :ssh_options, options
  p options, host, ssh_port
end



# Disable sudo
# set :disable_sudo, true


# Set environment variables
# set :env, :LANG => 'C', :LC_MESSAGES => 'C'

# Set PATH
# set :path, '/sbin:/usr/local/sbin:$PATH'



# Define packages
Packages = {
  'filebeat' => {
    version: '5.6.5'
  },
  'metricbeat' => {
    version: '5.6.5'
  },
  'heartbeat' => {
    version: '5.6.5'
  },
  'packetbeat' => {
    version: '5.6.5'
  },
  'osquery' => {
    version: '2.10.2-1.linux'
  }
}

# Define Installed services
InstalledServices = [
  'filebeat',
  'metricbeat',
  'heartbeat',
  'packetbeat',
  'osqueryd'
]

# Define Active services
ActiveServices = [
]