class kerberos {
  augeas { 'change default realm in krb5.conf':
    context => '/files/etc/krb5.conf/libdefaults/default_realm',
    changes => 'set default_realm PUPPETLABS.VM',
  }
}
