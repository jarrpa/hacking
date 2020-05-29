# jarrpa-hacking
General hacking scripts, tools, or configurations used by jarrpa

## git
* **gitconfig:** My global .gitconfig
* **git-reviewed.sh:** A script for doing e-mail based git reviews

## vim
My vim setup is a little weird, but then again so would anyone's be after a few
years. I frequently find myself editing system files where I would like to have
my usual vim functionality, so I put my configurations mostly in `/etc`. On
Fedora, the default `/etc/vimrc` has a stanza to read custom local
configurations from `/etc/vimrc.local`. Using that, I maintain two files:

* **vimrc.local:** My primary vim config
* **vimrc.coc:** Another vim config file, included by `vimrc.local`, for
  configuring the [CoC plugin|https://github.com/neoclide/coc.nvim/].

In addition, CoC takes some additional configuration that must be specified in
my home directory:

* **coc-settings.json:** CoC language server settings

These days I work primarily in Go and Bash. To set up my vim environment on
Fedora 31, I did the following steps:

1. `curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo`
1. `sudo dnf install vim python3-neovim vim-go vim-fugitive yarn`
1. Install vimrc files to `/etc`
1. `vim +PlugInstall`
1. `vim +GoInstallBinaries`
1. `npm i -g bash-language-server`
1. Install `coc-settings.json` in `~/.vim`
