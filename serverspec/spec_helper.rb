require 'serverspec'

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

# Define services
Services = [
  'filebeat',
  'metricbeat',
  'heartbeat',
  'packetbeat',
  'osqueryd'
]