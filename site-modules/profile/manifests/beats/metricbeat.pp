#
#configuration for setting up metricbeat
#

class profile::beats::metricbeat{
  class {'metricbeat':
    max_start_delay => '10s',
    major_version  => '7',
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
      {
        'module'    => 'windows',
        'metricsets'=> 'perfmon',
        'enabled'   => 'true',
        'perfmon.queries' => [
          'counters' => [
            'name'  => "% Processor time",
            'field' => 'time.processor.pct',
            'format'=> 'float'
          ]
        ]
      }
    ],
    outputs => {
      'logstash' => {
      'hosts'    => ['logstash:5044'],
      },
      'enabled' => true,
    },
  }
}
