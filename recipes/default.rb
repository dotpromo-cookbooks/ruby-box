#
# Cookbook Name:: dotpromo-ruby-box
# Recipe:: default
#
# Copyright 2014, .PROMO Inc.
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'users'
users_manage 'deployer' do
  group_name "wheel"
end
include_recipe 'sudo'

if platform_family?('rhel')
  include_recipe 'yum-repoforge'
elsif platform_family?('debian')
  include_recipe 'apt'
else
  Chef::Application.fatal!('Unsupported platform')
end

# Install needed packages for ruby dev
node['dotpromo_ruby_box']['packages'].each do |k|
  package k
end

execute "Adding gpg key to deployer" do
  environment ({"HOME" => "/home/deployer"})
  command "`which gpg2 || which gpg` --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3;"
  user 'deployer'
  group 'deployer'
end

include_recipe 'rvm::user'
