node default {
  notify { "Oops Default! I'm ${facts['hostname']}": }
}

node /elk1/ {
  include ::role::elk_server
}

node /lin1/ {
  include ::role::linux
}

node /winc1/ {
  include ::role::windows_client
}

node /wins1/ {
  include ::role::windows_server
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
