#  
# Puppet code for configuring kibana
#

class profile::elk::kibana {
  class { 'kibana':
    config => {
    'server.port'                 => 8080,
    'server.host'                 => '0.0.0.0',
    'xpack.security.enabled'      => true,
    'elasticsearch.hosts'         => ['http://elasticsearch:9200'],
    'xpack.ingestManager.enabled' => true,
    'elasticsearch.password'      => 'password',
    'elasticsearch.username'      => 'elastic',
    },

  }
}
