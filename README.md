# Liam's Neovim configuration

Neovim with this configuration is the best development environment I've ever used.

The config uses the [Lazy](https://github.com/folke/lazy.nvim) package manager and was kickstarted using [LazyVim](https://www.lazyvim.org/). I hope you find this config useful!

## Python Provider Configuration

To set up the Python provider, run the following commands:

```sh
python3 -m venv ~/.config/nvim/py3nvim
source ~/.config/nvim/py3nvim/bin/activate
python3 -m pip install neovim
```

And ensure `vim.g.python3_host_prog = '~/.config/nvim/py3nvim/bin/python'` is set in a .lua file. In this repo it's set in `options.lua`.
