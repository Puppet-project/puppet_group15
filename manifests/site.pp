node default {
  notify { "Oops Default! I'm ${facts['hostname']}": }
}

node /logstash/ {
  include ::role::logstash
}

node /kibana/ {
  include ::role::kibana
}

node /elasticsearch/ {
  include ::role::elasticsearch
}

node /lin1/ {
  include ::role::linux
}

node /win/ {
  include ::role::windows_client
}

node 'manager.node.consul' {
  include ::role::manager_server
}

node 'dir.node.consul' {
  include ::role::directory_server
}

node 'mon.node.consul' {
  include ::role::monitoring_server
}
