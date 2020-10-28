#  
# role:server for all windows clients
#

class role::windows_client {
  include ::profile::base_windows
  include ::profile::dns::client
  include ::profile::consul::client
  include ::profile::sensu::agent_windows
}
