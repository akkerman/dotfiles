# dotfiles

Following this [guide](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/)


```sh
git clone git@github.com:akkerman/dotfiles.git .dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
config checkout
```
