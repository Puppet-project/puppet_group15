#
#configuration for setting up winlogbeat
#

class profile::beats::winlogbeat{
  class {'winlogbeat':
    outputs => {
      'logstash' => {
        'hosts' => [ 'http://logstash:5044' ],
        'index' => 'winlogbeat',
      },
    conf_template => 'C:\ProgramData\PuppetLabs\code\environments\dev\data\winlogbeat.yml'
    },
  }
}
