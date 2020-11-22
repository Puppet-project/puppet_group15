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

  if facts[:osfamily] == 'Ubuntu'

  describe 'profile::elk::elasticsearch' do
      it { is_expected.to contain_class('elastic_stack::repo') }
      it { is_expected.to contain_class('elasticsearch') }
  end

  describe 'elasticsearch' do
    let(:params) { {'restart_on_change' => true} }
    it { is_expected.to contain_file('/etc/elasticsearch/es-01/elasticsearch.yml').with( 
      'discovery.seed_hosts' => $facts[networking][ip], 
      'discovery.type' => 'single-node',
      'network.host'   => '0.0.0.0',
      'node.name'      => 'elasticsearch-es-01',
      'path.data'      => '/var/lib/elasticsearch/es-01',
      'path.logs'      => '/var/log/elasticsearch/es-01'
    ) }

    it { is_expected.to contain_file('/etc/elasticsearch/es-01/jvm.options').with(
      '11:-XX:+UseG1GC',
      '11:-XX:InitiatingHeapOccupancyPercent=75',
      '8:-XX:+PrintGCApplicationStoppedTime',
      '8:-XX:+PrintGCDateStamps',
      '8:-XX:+PrintTenuringDistribution',
      '8:-XX:+UseCMSInitiatingOccupancyOnly',
      '8:-XX:+UseConcMarkSweepGC',
      '8:-XX:+UseGCLogFileRotation',
      '8:-XX:CMSInitiatingOccupancyFraction=75',
      '8:-XX:GCLogFileSize=64m',
      '8:-XX:NumberOfGCLogFiles=32'
    ) }
    
      end
    end
  end
end