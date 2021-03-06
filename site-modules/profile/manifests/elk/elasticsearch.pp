#  
# Puppet code for configuring elasticsearch
#

class profile::elk::elasticsearch {
  #include ::java
  include elastic_stack::repo

  class { 'elasticsearch':
    restart_on_change => true,
    config            => {
      'network.host'         => '0.0.0.0',
      'discovery.seed_hosts' => $facts[networking][ip],
      'discovery.type'       => 'single-node',
    },


  #elasticsearch dont work properly on jdk11. This removes deprecated functions
  jvm_options         => [
      '8:-XX:NumberOfGCLogFiles=32',
      '8:-XX:GCLogFileSize=64m',
      '8:-XX:+UseGCLogFileRotation',
      '8:-XX:+PrintTenuringDistribution',
      '8:-XX:+PrintGCDateStamps',
      '8:-XX:+PrintGCApplicationStoppedTime',
      '8:-XX:+UseConcMarkSweepGC',
      '8:-XX:+UseCMSInitiatingOccupancyOnly',
      '8:-XX:CMSInitiatingOccupancyFraction=75',
      '11:-XX:+UseG1GC',
      '11:-XX:InitiatingHeapOccupancyPercent=75'
      ]
  }

  #fixes a bug where elastic cant find the conf file.
  file_line { 'path_conf':
    path => '/etc/default/elasticsearch',
    line => 'ES_PATH_CONF=/etc/elasticsearch/es-01',
  }


  elasticsearch::instance { 'es-01':}
}
