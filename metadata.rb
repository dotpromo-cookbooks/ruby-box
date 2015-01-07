name 'dotpromo-ruby-box'
version '0.2'

maintainer '.PROMO Inc.'
maintainer_email 'Alexander Simonov <alex@simonov.me>'
license 'MIT'

description 'Install rvm, ruby and create deployer user'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))

supports 'ubuntu', '>= 12.04'
supports 'centos', '>= 6.5'

depends 'users'
depends 'rvm'
depends 'apt'
depends 'sudo'
depends 'yum-repoforge'
