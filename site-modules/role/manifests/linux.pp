class role::linux {
    include ::profile::base_linux
    include ::profile::dns::client
    include ::profile::consul::client
    include ::profile::sensu::agent_linux
    
}
