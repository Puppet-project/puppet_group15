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
    conf_template => 'C:\Program files\winlogbeat\winlogbeat.yml'
    },
  }
}
