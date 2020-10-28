class{'metricbeat':
  modules => [
    {
      'module'     => 'system',
      'metricsets' => [
        'cpu',
        'load',
        'memory',
        'process',
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
