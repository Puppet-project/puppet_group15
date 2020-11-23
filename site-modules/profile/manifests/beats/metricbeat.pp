#
#configuration for setting up metricbeat
#

class profile::beats::metricbeat{
  class { 'metricbeat':
    modules => [
      {
        'module'     => 'system',
        'metricsets' => [
          'cpu',
          'load',
          'memory',
          'process',
          'uptime',
          'diskio'
        ],
        'processes'  => ['.*'],
      },
    ],
    outputs => {
      'logstash' => {
        'hosts'    => ['logstash:5044'],
      },
      'enabled' => true,
    },
  }
}
