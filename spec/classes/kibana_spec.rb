require 'spec_helper'

on_supported_os.each do |os, os_facts|
  context "on #{os}" do
    let(:facts) { os_facts }
  
    if facts[:osfamily] == 'Ubuntu'
    
    describe 'profile::elk::kibana' do
      it { is_expected.to contain_class('kibana') }
    end
      
      describe 'kibana' do
        it { is_expected.to contain_file('/etc/kibana/kibana.yml').with(
          'elasticsearch.hosts'         => [ 'http://elasticsearch:9200' ],
          'elasticsearch.password'      => 'password',
          'elastisearch.username'       => 'elastic',
          'server.host'                 => '0.0.0.0',
          'server.port'                 => '8080',
          'xpack.ingestManager.enabled' => 'true',
          'xpack.security.enabled'      => 'true'

      end
    end
  end
end