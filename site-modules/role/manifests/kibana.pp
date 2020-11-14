#  
# role:server for hosting kibana
#

class role::elk_server {
    include ::profile::base_linux
    include ::profile::dns::client
    include ::profile::consul::client
    include ::profile::sensu::agent_linux
    include ::profile::elk::kibana
}