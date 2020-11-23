#
#configuration for setting up filebeat
#

class profile::beats::filebeat{
  class { 'filebeat':
    outputs => {
      'logstash' => {
      'hosts'   => [
        'logstash:5044',
      ],
      'enabled' => true,
      },
    },
    }

    filebeat::input { 'syslogs':
    paths    => [
      '/var/log/auth.log',
      '/var/log/syslog',
    ],
    doc_type => 'syslog-beat',
  }
}
