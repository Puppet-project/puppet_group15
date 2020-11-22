#  
# Puppet code for configuring logstash
#

class profile::elk::logstash {
  require java

  class { 'logstash':
    #fixes a problem where logstart wont start
    jvm_options => [
      '-DUseParNewGC=disable',
      '-DUseConcmarksweepgc=disable',
      '-XX:+UseG1GC',
      'SuccessExitStatus=143',
    ],
  }
  logstash::configfile {'my_ls_config':
    content => template('/etc/puppetlabs/code/environments/dev/data/logstash.conf'),
    }
}
