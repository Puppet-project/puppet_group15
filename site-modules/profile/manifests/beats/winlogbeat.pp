#
#configuration for setting up winlogbeat
#

class profile::beats::winlogbeat{
  class {'winlogbeat':
    major_version  => '4',
    outputs => {
      'logstash' => {
        'hosts' => [ 'http://logstash:5044' ],
        'index' => 'winlogbeat',
      }
    },
    config_file => 'C:\Program Files\winlogbeat\winlogbeat.yml',
  }
}
