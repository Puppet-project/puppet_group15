#  
# role:server for hosting the elk stack
#

class role::elasticsearch {
    include ::profile::base_linux
    include ::profile::dns::client
    include ::profile::consul::client
    include ::profile::sensu::agent_linux
    include ::profile::elk::elasticsearch
}
