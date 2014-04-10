name             'deis'
maintainer       'OpDemand LLC'
maintainer_email 'chefs@opdemand.com'
license          'Apache 2.0'
description      'Installs/Configures components of the Deis PaaS'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.8.0'

depends          'apt',       '~> 2.3'
depends          'docker',    '~> 0.33.1'
depends          'sudo',      '~> 2.5'
depends          'rsyslog',   '~> 1.12'

# https://github.com/hw-cookbooks/dpkg_autostart/pull/8
depends          'dpkg_autostart',   '~> 0.1.11'

supports         'ubuntu'
