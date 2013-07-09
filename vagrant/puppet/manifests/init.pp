include tools

class { 'nodejs':
  version => 'v0.10.12',
  require => Class["tools"],
}

class { "mongodb":
  enable_10gen => true,
}

include nodejs
include mongodb
