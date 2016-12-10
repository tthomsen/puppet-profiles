require 'spec_helper'

describe 'profiles' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "profiles class without any parameters" do
          
        end
      end
    end
  end
end
