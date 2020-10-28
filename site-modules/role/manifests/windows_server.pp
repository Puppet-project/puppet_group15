#  
# role:windows servers
#

class role::windows_server {
  include ::profile::base_windows_server
  include ::profile::dns::client
  include ::profile::consul::client
  include ::profile::sensu::agent_windows
}
