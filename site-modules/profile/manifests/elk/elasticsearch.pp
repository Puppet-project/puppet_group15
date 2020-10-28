include ::java

class profile::elk::elasticsearch {
  class { 'elasticsearch':
  restart_on_change => true
  }
  
}



