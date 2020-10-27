class role::elk_server {
    include ::profile::base_linux
    include ::profile::base_elk
    include ::profile::dns::client
    include ::profile::consul::client
    include ::profile::sensu::agent_linux
}