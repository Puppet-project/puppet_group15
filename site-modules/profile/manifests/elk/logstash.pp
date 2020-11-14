#  
# Puppet code for configuring logstash
#

class profile::elk::logstash {
  include ::logstash

  class { 'logstash':
  }
  logstash::configfile {'my_ls_config':
    content => 'input { metricbeat {} } output { null {} }',
    }
}
