# frozen_string_literal: true

require 'spec_helper'

describe 'elasticsearch' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }


      #describe 'profile::elk::elasticsearch' do
       #it { is_expected.to contain_class('elastic_stack::repo') }
       #it { is_expected.to contain_class('elasticsearch') }
      #end

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

      it { is_expected.to compile }
    end
  end
end