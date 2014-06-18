default['authorization']['sudo']['groups'] = %w(admin wheel)
default['authorization']['sudo']['users'] = %w(deployer)
default['authorization']['sudo']['passwordless'] = true
default['authorization']['sudo']['include_sudoers_d'] = true
default['authorization']['sudo']['agent_forwarding'] = true
default['rvm']['user_installs'] = [
  {
    'user' => 'deployer',
    'default_ruby' => 'ruby-2.1'
  }
]
default['dotpromo_ruby_box']['packages'] = %w(git curl htop atop screen vim)
