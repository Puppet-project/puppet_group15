
class profile::elk::kibana {
   class { 'kibana':
    config => {
    'server.port' => '80',
    },
    require => Es_Instance_Conn_Validator['elk1'],
    ensure => running,
  }
}
