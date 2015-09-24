class people::spazm {
  include zsh # require zsh and change shell
  include macvim

  # install brew packages:
  package { "tmux" : ensure => present }

  # install user dotfiles
  $home     = "/Users/${::boxen_user}"
  $my       = "${home}/my"
  $dotfiles = "${my}/dotfiles"

  file { $my:
    ensure  => directory
  }

  repository { $dotfiles:
    source  => 'spazm/dotfiles',
    require => File[$my]
  }
}
