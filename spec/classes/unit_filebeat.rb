require 'spec_helper'

on_supported_os.each do |os, os_facts|
  context "on #{os}" do
    let(:facts) { os_facts }
  
    if facts[:osfamily] == 'Ubuntu'

      describe 'profile::beats::filebeat' do
        it { is_expected.to contain_class('filebeat') }
      end
        
        describe 'kibana' do
          it { is_expected.to contain_file('/etc/filebeat/filebeat.yml'.with(
            'output'  => {
              'hosts' => [
                 'logstash:5044',   
              ],
              'enabled' => 'true',
            },
          )}
      end
    end
  end
end