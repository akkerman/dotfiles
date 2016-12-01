# Files related to [VIM](http://www.vim.org/about.php)

## installation instructions
`git clone ssh://git@octotron:2222/linux-config/vim.git ~/.vim/`

`apt install fontconfig`

read and execute `install.sh`

## .vimrc
A custom .vimrc is normally stored at ~/.vimrc, but aparently VIM also
understands when put here so I can keep it under version control in the
same repo.

## tmuxline.vim
When running vim inside tmux, this plugin will change the status of tmux.  
It was configured using `Tmuxline airline`  
a snapshot was created which should be sourced in .tmux.conf:
`source ~/.vim/tmuxline.conf`

## templates
Templates are in a sub-directory of this one
