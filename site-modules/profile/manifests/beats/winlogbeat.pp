#configuration for setting up metricbeat

class profile::beats::winlogbeat{
  class {'winlogbeat':
    outputs => {
      'elasticsearch' => {
        'hosts'    => [ 'http://elasticsearch:9200' ],
        'index'    => 'winlogbeat',
        'username' => 'elastic',
        'password' => 'changeme',
      },
    },
  }
}
