require 'spec_helper'

describe 'apache', :type => :class do

  describe 'when called with no params for RedHat' do
    let(:facts) { { :os              => { 'family' => 'Redhat' },  # structured fact
                    :operatingsystem => 'CentOS',
                    :osfamily        => 'RedHat'                   # legacy string fact
                } }

    it do
      is_expected.to contain_package('apache').with({
        'ensure' => 'present',
        'name'   => 'httpd',
      })
      is_expected.to contain_file('apache_config').with({
        'ensure' => 'file',
        'path'   => '/etc/httpd/conf/httpd.conf',
        'source' => "puppet:///modules/apache/#{facts[:osfamily]}.conf",
      })
      is_expected.to contain_service('apache').with({
        'ensure' => 'running',
        'name'   => 'httpd',
      })
    end
  end
end
