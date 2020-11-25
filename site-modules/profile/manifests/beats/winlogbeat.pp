#
#configuration for setting up winlogbeat
#

class profile::beats::winlogbeat{
  class {'winlogbeat':
    outputs => {
      'logstash'  => {
        'hosts' => [ 'logstash:5044' ],
        'index' => 'winlogbeat',
      },
    conf_template => 'C:\ProgramData\PuppetLabs\code\environments\production\data\winlogbeat.yml'
    },
  }
}
