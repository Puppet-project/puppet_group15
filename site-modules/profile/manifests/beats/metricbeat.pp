class profile::beats::metricbeat {
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
      'hosts' => ['http://elasticsearch:9200'],
      'index' => 'metricbeat',
    },
  },
}
