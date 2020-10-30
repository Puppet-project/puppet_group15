#  
# Puppet code for configuring kibana
#

class profile::elk::kibana {
  class { 'kibana':
    config => {
    'server.port'            => '8080',
    'server.host'            => '0.0.0.0',
    'xpack.security.enabled' => 'true'
    },

  }
}
