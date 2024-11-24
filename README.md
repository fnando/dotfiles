# Dotfiles

![Screenshot of my terminal](https://github.com/fnando/dotfiles/blob/main/terminal.png)

Welcome to my dotfiles! It features:

- Light theme
- ZSH configuration
- [ASDF](https://github.com/asdf-vm/asdf) as package manager

## Requirements

### Install dependencies

On macOS:

```bash
brew install stow git zsh starship jq fnando/tap/ll fnando/tap/op-env
brew install iterm2 --cask
```

### Install ZSH

Make it available:

```bash
grep -q -f $(which zsh) /etc/shells || echo $(which zsh) | sudo tee -a /etc/shells
```

Finally, set it as the default shell:

```bash
chsh -s $(which zsh)
```

On macOS you may want to disable the line that sets the `PATH` on
`/etc/zprofile`.

### Install Dotfiles

1. Clone https://github.com/fnando/dotfiles somewhere, like `~/.dotfiles`.
2. Go to `~/.dotfiles` then run `./install`.
3. Now run `stow fnando -t $HOME` to symlink all config files.
4. Restart your terminal.

How it works: most of the configuration is managed by
[stow](https://www.gnu.org/software/stow/), which symlinks files to the right
places. That means you can easily add or remove configurations by adding or
changing files on the `~/.dotfiles` directory. Then you can commit and push
these changes to your own repo.

### Install ASDF

Now you can install some plugins for ASDF:

- `asdf plugin add ruby`
- `asdf plugin add nodejs`
- `asdf plugin add rust`

### Install Nerd Fonts

Install a [Nerd Font](https://github.com/ryanoasis/nerd-fonts) and activate it
on your terminal profile. I personally like
[JetBrains Mono](https://www.jetbrains.com/lp/mono/)'s variant.

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
