require 'spec_helper'

#describe 'role::elasticsearch' do
#    it { is_expected.to contain_class('::profile::base_linux') }
#    it { is_expected.to contain_class('::profile::dns::client') }
#    it { is_expected.to contain_class('::profile::consul::client') }
#    it { is_expected.to contain_class('::profile::sensu::agent_linux') }
#    it { is_expected.to contain_class('::profile::elk::elasticsearch') }
#end

on_supported_os.each do |os, os_facts|
  context "on #{os}" do
    let(:facts) { os_facts }

  if facts[:osfamily] == ’Ubuntu’

  describe 'profile::elk::elasticsearch' do
      it { is_expected.to contain_class('elastic_stack::repo') }
  end

  describe 'elasticsearch' do
    let(:params) { {'restart_on_change' => true} }
    it { should contain_file(’/etc/elasticsearch/es-01/elasticsearch.yml’).with( 
      'discovery.seed_hosts' => $facts[networking][ip], 
      'discovery.type' => 'single-node',
      'network.host'   => '0.0.0.0',
      'node.name'      => 'elasticsearch-es-01',
      'path.data'      => '/var/lib/elasticsearch/es-01',
      'path.logs'      => '/var/log/elasticsearch/es-01',
    ) }
    
      end
    end
  end
end