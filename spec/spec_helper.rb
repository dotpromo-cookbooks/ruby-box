require 'chefspec'
require 'chefspec/berkshelf'
require_relative 'support/users_manage'

RSpec.configure do |config|
  config.platform = 'centos'
  config.version = '6.5'
  config.log_level = :error
end

at_exit { ChefSpec::Coverage.report! }
