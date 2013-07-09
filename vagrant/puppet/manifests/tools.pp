class tools {
  package { "g++":
    ensure => present,
  }

  package { "git":
    ensure => present,
  }

  package { "make":
    ensure => present,
  }
}
