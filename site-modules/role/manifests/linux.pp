#  
# role:server for all linux clients
#

class role::linux {
    include ::profile::base_linux
    include ::profile::dns::client
    include ::profile::consul::client
    include ::profile::sensu::agent_linux
    include ::profile::beats::metricbeat
}
