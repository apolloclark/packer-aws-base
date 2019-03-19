require_relative '../spec_helper'

# Define packages
Packages = {
  'filebeat' => {
    version: '6.6.2'
  },
  'metricbeat' => {
    version: '6.6.2'
  },
  'heartbeat-elastic' => {
    version: '6.6.2'
  },
  'packetbeat' => {
    version: '6.6.2'
  },
  'auditbeat' => {
    version: '6.6.2'
  },
  'osquery' => {
    version: '2.11.2-1.linux'
  }
}

# Define Installed services
InstalledServices = [
]

# Define Running services
ActiveServices = [
]



# https://www.singlestoneconsulting.com/articles/writing-efficient-infrastructure-tests-with-serverspec
# Verify packages
Packages.each do |name, details|
  describe package(name) do
    it { should be_installed.with_version(details[:version]) }
  end
end

# Verify services
InstalledServices.each do |name|
  describe service(name) do
    it { should be_enabled }
  end
end

# Verify services
ActiveServices.each do |name|
  describe service(name) do
    it { should be_running }
  end
end

describe port(22) do
  it { should be_listening }
end
