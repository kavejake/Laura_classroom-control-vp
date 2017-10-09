define system::managed_user (
  $home = undef,
  $passwd,
) {
  if $home {
    $homedir = $home
  } else {
    $homedir = "/home/${title}"
  }

  File {
    owner => $title,
    group => 'wheel',
    mode  => '0644',
  }

  user { $title: 
    ensure   => present,
    password => $passwd,
  }

  # if user is in Linux
  if $facts['kernel'] == 'Linux' {
    file { "bashrc_${title}":
      ensure  => file,
      path    => "${homedir}/.bashrc",
      content => epp('templates/bashrc.epp'),
    }
  }

}
