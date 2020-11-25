# frozen_string_literal: true

require 'spec_helper'

describe 'kibana' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      describe 'kibana' do
        it { is_expected.to contain_file('/etc/kibana/kibana.yml').with(
          'elasticsearch.hosts'         => [ 'http://elasticsearch:9200' ],
          'elasticsearch.password'      => 'password',
          'elastisearch.username'       => 'elastic',
          'server.host'                 => '0.0.0.0',
          'server.port'                 => '8080',
          'xpack.ingestManager.enabled' => 'true',
          'xpack.security.enabled'      => 'true'
        ) }
        end

      it { is_expected.to compile }
    end
  end
end