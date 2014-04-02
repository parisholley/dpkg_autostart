require 'chefspec'
require 'chefspec/berkshelf'

# See https://github.com/sethvargo/chefspec/issues/393
# ChefSpec::Coverage.start!

# Specify defaults -- these can be overridden
RSpec.configure do |config|
  config.log_level = :error # necessary to suppress all the WARNs for Chef resource cloning
  config.platform = 'ubuntu'
  config.version = '12.04'
  config.before(:each) do
    stub_command('/opt/chef/embedded/bin/gem list macaddr | grep "(1.6.1)"').and_return(false)
    etcd = double
    require 'etcd'
    Etcd.stub(:client).and_return(etcd)
    allow(etcd).to receive(:get).and_raise(Net::HTTPFatalError.new('stub', 503))
  end
end
