#
# profile::base_elk
#

class profile::base_elk {
  include ::profile::elk::elasticsearch
  include ::profile::elk::kibana
  include elastic_stack::repo

  elasticsearch::instance { 'elk1': }
}
