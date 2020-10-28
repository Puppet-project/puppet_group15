#  
# Puppet code for configuring elasticsearch
#

class profile::elk::elasticsearch {
  include ::java

  class { 'elasticsearch':
  restart_on_change => true,
  jvm_options       => [
      '-Xms4000m',
      '-Xmx4000m',
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
    line => 'ES_PATH_CONF=/etc/elasticsearch/elk1',
}

  elasticsearch::instance { 'elk1':}
}



