class profile::nagios_server {
  $nagios_dir = lookup('nagios_dir')

  class { 'nagios':
    install_dir => $nagios_dir,
  }

  include apache

  apache::virtual_host { 'nagios':
    docroot => $nagios_dir,
  }

  include snmp

  snmp::v3_user { 'nagios': }
}
