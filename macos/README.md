# macOS

## Setting up a new Mac

```console
$ # install Xcode Command Line Tools
$ xcode-select --install
$ # install Homebrew
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
$ # clone the dotfiles repo
$ git clone https://github.com/adamelmore/dotfiles.git ~/.dotfiles
$ # install Brewfile
$ cd ~/.dotfiles/macos
$ brew bundle
$ # setup mac defaults
$ ./set-defaults.sh
$ cd ..
$ # install oh-my-fish (omf)
$ curl -sfL https://get.oh-my.fish | fish
$ # bootstrap dotfiles
$ ./script/bootstrap.fish
$ # copy SSH key into ~/.ssh, then:
$ chmod 0600 ~/.ssh/id_rsa
$ # setup gpg signing
$ gpg --list-keys
$ echo "pinentry-program /usr/local/bin/pinentry-mac" >> ~/.gnupg/gpg-agent.conf
$ killall gpg-agent
$ export GPG_TTY=$(tty)
$ keybase pgp export -q <key-id> | gpg --import
$ keybase pgp export -q <key-id> --secret | gpg --import --allow-secret-key-import
$ git config --global gpg.program $(which gpg)
$ git config --global user.signingkey <key-id>
$ git config --global commit.gpgsign true
$ # test gpg signing
$ mkdir -p /tmp/test
$ cd $_
$ git init
$ git commit --allow-empty -m 'signsss'
$ git log --show-signature
$ # reboot
$ sudo reboot
```
