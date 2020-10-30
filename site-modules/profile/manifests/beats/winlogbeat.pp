#configuration for setting up metricbeat

class profile::beats::winlogbeat{
  class {'winlogbeat':
    outputs => {
      'elasticsearch' => {
        'hosts' => [
          'http://elk1:9200'
        ],
        'index'       => 'winlogbeat'
      },
    },
  }
}
