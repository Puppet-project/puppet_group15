#
# profile::base_linux
#

class profile::base_linux {

  $gjert_ssh_key = lookup('base_linux::gjert_ssh_key')
  $erlend_ssh_key = lookup('base_linux::erlend_ssh_key')
  $christian_ssh_key = lookup('base_linux::christian_ssh_key')
  $linux_sw_pkg = lookup('base_linux::linux_sw_pkg')

# careful when configuring ntp to avoid misuse (opening for DDOS)
  class { 'ntp':
    servers  => [ 'ntp.ntnu.no' ],
    restrict => [
      'default kod nomodify notrap nopeer noquery',
      '-6 default kod nomodify notrap nopeer noquery',
    ],
  }
  class { 'timezone':
    timezone => 'Europe/Oslo',
  }

  package { $linux_sw_pkg:
    ensure => latest,
  }

# root@manager should be able to ssh without password to all

  file { '/root/.ssh':
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0700',
  }
  ssh_authorized_key { 'gmhomb@loginstud03':
    user    => 'root',
    type    => 'ssh-rsa',
    key     => $gjert_ssh_key,
    require => File['/root/.ssh'],
  }
  ssh_authorized_key { 'Generated-by-Nova':
    user    => 'root',
    type    => 'ssh-rsa',
    key     => $erlend_ssh_key,
    require => File['/root/.ssh'],
  }
    ssh_authorized_key { 'chrissis@loginstud03':
    user    => 'root',
    type    => 'ssh-rsa',
    key     => $christian_ssh_key,
    require => File['/root/.ssh'],
  }
# automatic updates

  include ::profile::secupd::linsec
  #include ::profile::beats::metricbeat

}

