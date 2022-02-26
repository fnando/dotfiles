# Dotfiles

![Screenshot of my terminal](https://github.com/fnando/dotfiles/blob/main/screenshots/terminal.png)

Welcome to my dotfiles! It features:

- Light theme
- ZSH configuration
- [pry](http://pryrepl.org) as Ruby REPL
- [ASDF](https://github.com/asdf-vm/asdf) as package manager

## Requirements

### Install ZSH

On Mac:

```bash
brew install zsh
```

Then make it available:

```bash
grep -q -f $(which zsh) /etc/shells || echo $(which zsh) | sudo tee -a /etc/shells
```

Finally, set it as the default shell:

```bash
chsh -s $(which zsh)
```

On OSX you may want to disable the line that sets the `PATH` on `/etc/zprofile`.

### Install Dotfiles

To install these dotfiles, execute the following command:

```bash
# If you have curl installed ########################################
curl -Ls https://raw.github.com/fnando/dotfiles/main/install | bash

# If you have wget installed ########################################
wget -q -O - https://raw.github.com/fnando/dotfiles/main/install | bash
```

To upgrade your configuration to the latest version, run `dotfiles`.

Any specific configuration should go to `~/.zsh/user.sh`. This file is kept
around between upgrades, so you won't lose any configuration specific to your
own user.

### Install ASDF

After, installing these dotfiles and restarting your terminal, you can install
manager for the Ruby and Node as the following:

- `asdf plugin-add ruby`
- `asdf plugin-add nodejs`

### Install Nerd Fonts

Install a [Nerd Font](https://github.com/ryanoasis/nerd-fonts) and activate it
on your terminal profile. I personally like
[JetBrains Mono](https://www.jetbrains.com/lp/mono/)'s variant.

### Install colorls

Install [colorls](https://rubygems.org/gems/colorls) for `ll` with icons.

## License

Copyright (c) 2014 Nando Vieira

MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
