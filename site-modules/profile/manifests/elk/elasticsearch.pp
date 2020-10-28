class profile::elk::elasticsearch {
  include ::java

  class { 'elasticsearch':
  restart_on_change => true,
  ensure => running,
  }
  
  elasticsearch::instance { 'elk1': }
}



