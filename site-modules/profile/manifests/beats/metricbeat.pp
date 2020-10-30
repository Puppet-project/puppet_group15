#configuration for setting up metricbeat

class profile::beats::metricbeat{
  class{'metricbeat':
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
      'elasticsearch' => {
        'hosts' => ['http://elk1:9200'],
        'index' => 'metricbeat',
      },
    },
  }
}
