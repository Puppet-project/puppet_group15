#
#configuration for setting up winlogbeat
#

class profile::beats::winlogbeat{
  class {'winlogbeat':
    outputs => {
      'logstash'   => {
        'hosts' => [ 'http://logstash:5044' ],
        'index' => 'winlogbeat',
      },
      'event_logs' => {
        'name' => 'Application',
        'name' => 'Security',
        'name' => 'System',
      }
    },
  }
}
