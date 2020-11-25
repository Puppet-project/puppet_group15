# frozen_string_literal: true

require 'spec_helper'

describe 'logstash' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      describe 'logstash' do
        it { is_expected.to contain_file('/etc/logstash/jvm.options').with(
          '-DUseParNewGC=disable',
          '-DUseConcmarksweepgc=disable',
          '-XX:+UseG1GC',
          'SuccessExitStatus=143'
         ) }

      end
      it { is_expected.to compile }
    end
  end
end