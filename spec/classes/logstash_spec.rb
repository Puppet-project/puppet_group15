require 'spec_helper'

on_supported_os.each do |os, os_facts|
  context "on #{os}" do
    let(:facts) { os_facts }
    
    if facts[:osfamily] == 'Ubuntu'

    describe 'profile::elk::logstash' do
      let(:params) { {'require' => ref('Package', 'java')} }
      it { is_expected.to contain_class('logstash') }
    end

    describe 'logstash' do
      it { is_expected.to contain_file('/etc/logstash/jvm.options').with(
        '-DUseParNewGC=disable',
        '-DUseConcmarksweepgc=disable',
        '-XX:+UseG1GC',
        'SuccessExitStatus=143'
      ) }

      end
    end
  end
end