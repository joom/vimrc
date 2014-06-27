# vimrc
My personal vim settings and plugins.

After cloning the repository to ~/.vim, edit your ~/.vimrc file to this:

```
" Load the first file named 'vimrc' found in runtimepath
runtime vimrc
```

Then install Vundle by running this in terminal/shell:

```
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

After that, you need to install the plugins by running this in terminal/shell: (You may need to run it with `sudo ` in the beginning in OS X.)

```
vim +PluginInstall
```

You're all set! Enjoy!
