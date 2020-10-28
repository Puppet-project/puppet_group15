#  
# Puppet code for configuring kibana
#

class profile::elk::kibana {
  class { 'kibana':
    config => {
    'server.port' => '80',
    },

  }
}
