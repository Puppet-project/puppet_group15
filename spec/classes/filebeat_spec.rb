# frozen_string_literal: true

require 'spec_helper'

describe 'filebeat' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to contain_file('/etc/filebeat/filebeat.yml'.with(
        'output'  => {
        'hosts' => [
        'logstash:5044',
        ],
          'enabled' => 'true',
          }
         )

      it { is_expected.to compile }
    end
  end
end