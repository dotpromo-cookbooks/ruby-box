require 'minitest/spec'
require 'minitest-chef-handler'
describe_recipe 'dotpromo-ruby-box::default' do
  include MiniTest::Chef::Assertions
  include MiniTest::Chef::Context
  include MiniTest::Chef::Resources
  describe 'packages' do
    %w(git curl htop atop screen vim).each do |k|
      it "installs #{k}" do
        package(k).must_be_installed
      end
    end
  end
  it 'should have .rvm folder' do
    directory('/home/deployer/.rvm').must_exist.with(:owner, 'deployer')
  end
  it 'should have default ruby' do
    result = assert_sh '/home/deployer/.rvm/rubies/default/bin/ruby --version'
    assert_includes result, 'ruby 2.2.0'
  end
  describe 'users and groups' do
    it 'creates a deployer user' do
      user('deployer').must_exist
    end
    it 'creates a deployer group' do
      group('deployer').must_exist
    end
  end
end
