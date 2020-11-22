#  
# role:server for hosting logstash
#

class role::logstash {
    include ::profile::base_linux
    include ::profile::dns::client
    include ::profile::consul::client
    include ::profile::sensu::agent_linux
    include ::profile::elk::logstash
}
