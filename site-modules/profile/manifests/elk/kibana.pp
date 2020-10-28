#  
# Puppet code for configuring kibana
#

class profile::elk::kibana {
  class { 'kibana':
    config => {
    'server.port' => '8080',
    'server.host' => '10.212.140.8', #temporary test
    },

  }
}
