# dotfiles

Copy any config with curl from the raw files:

## tmux

```sh
curl https://raw.githubusercontent.com/joneszach/dotfiles/master/.tmux.conf -o ~/.tmux.conf
```

## vim

```sh
curl https://raw.githubusercontent.com/joneszach/dotfiles/master/.vimrc -o ~/.vimrc
```

## zellij

```sh
mkdir -p ~/.config/zellij/layouts
curl https://raw.githubusercontent.com/joneszach/dotfiles/master/.config/zellij/config.kdl -o ~/.config/zellij/config.kdl
curl https://raw.githubusercontent.com/joneszach/dotfiles/master/.config/zellij/layouts/bottom-bar.kdl -o ~/.config/zellij/layouts/bottom-bar.kdl
```

## all in one

```sh
mkdir -p ~/.config/zellij/layouts && \
curl https://raw.githubusercontent.com/joneszach/dotfiles/master/.tmux.conf -o ~/.tmux.conf && \
curl https://raw.githubusercontent.com/joneszach/dotfiles/master/.vimrc -o ~/.vimrc && \
curl https://raw.githubusercontent.com/joneszach/dotfiles/master/.config/zellij/config.kdl -o ~/.config/zellij/config.kdl && \
curl https://raw.githubusercontent.com/joneszach/dotfiles/master/.config/zellij/layouts/bottom-bar.kdl -o ~/.config/zellij/layouts/bottom-bar.kdl
```
