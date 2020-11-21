#  
# Puppet code for configuring logstash
#

class profile::elk::logstash {

  class { 'logstash':
  }
  logstash::configfile {'my_ls_config':
    content => template('/etc/puppetlabs/code/environments/dev/data/logstash.conf'),
    }
}
