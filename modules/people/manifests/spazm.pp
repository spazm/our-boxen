class people::spazm {
  include zsh # require zsh and change shell
  include vim # requires vim module in Puppetfile

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
