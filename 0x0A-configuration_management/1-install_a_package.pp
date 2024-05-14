# install puppet-lint -v 2.5.0

package { 'python3-pip':
  ensure => installed,
}

exec { 'install_flask':
  command => '/usr/bin/pip3 install Flask==2.1.0',
  path    => ['/usr/bin'],
  unless  => '/usr/bin/flask --version 2>&1 | grep "Flask 2.1.0"',
  require => Package['python3-pip'],
}

file { '/usr/local/bin/flask':
  ensure => link,
  target => '/usr/bin/flask',
  require => Exec['install_flask'],
}

