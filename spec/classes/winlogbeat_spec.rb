#Default test made by PDK
require 'spec_helper'
describe 'winlogbeat' do
  on_supported_os.each do |os, facts|
    context "on #{os} " do
      let :facts do
        facts
      end

      context 'with default values for all parameters' do
        it { is_expected.to contain_class('winlogbeat') }
      end
    end
  end
end
