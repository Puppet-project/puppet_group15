require 'spec_helper'

describe 'role::elasticsearch' do
    it { is_expected.to contain_class('::profile::base_linux') }
    it { is_expected.to contain_class('::profile::dns::client') }
    it { is_expected.to contain_class('::profile::consul::client') }
    it { is_expected.to contain_class('::profile::sensu::agent_linux') }
    it { is_expected.to contain_class('::profile::elk::elasticsearch') }
end

describe 'profile::elk::elasticsearch' do
    it { is_expected.to contain_class('elastic_stack::repo') }


describe 'elasticsearch' do
    let(:params) { {'restart_on_change' => true, 'config' => 
    {
    'network.host' => '0.0.0.0', 
    'discovery.seed_hosts' => $facts[networking][ip], 
    'discovery.type' => 'single-node'} } }


    end

end