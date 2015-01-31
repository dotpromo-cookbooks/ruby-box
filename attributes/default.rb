default['authorization']['sudo']['groups'] = %w(admin wheel)
default['authorization']['sudo']['users'] = %w(deployer)
default['authorization']['sudo']['passwordless'] = true
default['authorization']['sudo']['include_sudoers_d'] = true
default['authorization']['sudo']['agent_forwarding'] = true
default['rvm']['user_installs'] = [
    'user' =>  'deployer',
    'rubies' => ['2.2.0'],
    'default_ruby' => '2.2.0'
]
default['dotpromo_ruby_box']['packages'] = %w(git curl htop atop screen vim)
if platform_family?('rhel') && platform_version.to_i >= 7
  node.default['yum']['repoforge']['enabled'] = true
  node.default['yum']['repoforge']['mirrorlist'] =
    'http://mirrorlist.repoforge.org/el7/mirrors-repoforge'
  node.default['yum']['repoforge-extras']['mirrorlist'] =
    'http://mirrorlist.repoforge.org/el7/mirrors-repoforge-extras'
  node.default['yum']['repoforge-testing']['mirrorlist'] =
    'http://mirrorlist.repoforge.org/el7/mirrors-repoforge-testing'
  node.default['yum']['rpmforge']['mirrorlist'] =
    'http://mirrorlist.repoforge.org/el7/mirrors-rpmforge'
  node.default['yum']['rpmforge-extras']['mirrorlist'] =
    'http://mirrorlist.repoforge.org/el7/mirrors-rpmforge-extras'
end
