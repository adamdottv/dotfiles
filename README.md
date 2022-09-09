# dotfiles

> nvim, tmux, macOS defaults and brew bundle, etc.

## Installation

### Dependencies

These need to be installed, first. See [new macOS setup here](macos/README.md).

- `git`: to clone the repo
- `curl`: to download some stuff
- `tar`: to extract downloaded stuff
- `fish`: the shell
- `stow`: for managing symlinks

### Install

```console
$ git clone https://github.com/adamelmore/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
$ stow .
```

#### Update

To update, you just need to `git pull` and run `stow .` again:

```console
$ cd ~/.dotfiles
$ git pull origin main
stow .
```

### macOS defaults

Set up macOS defaults with:

```console
$DOTFILES/macos/set-defaults.sh
```

> Will require a system restart.

### Themes and fonts being used

Theme is **[Dracula](https://draculatheme.com)**, font is **Operator Mono**.
