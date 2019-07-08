## roku.vim

### overview

a vim plugin for roku development - provides brightscript language support (syntax highlighting, folding, section movement, indentation, etc) as well as channel installation/packaging from within vim.

![](screenshot.png)

### installation

#### Vundle
add this line to your .vimrc:
```vim
Plugin 'entrez/roku.vim'
```
then run the following in vim:
```vim
:source %
:PluginInstall
```

#### VimPlug
add this line to your .vimrc:
```vim
Plug 'entrez/roku.vim'
```
then run the following in vim:
```vim
:source %
:PlugInstall
```

#### Pathogen
run the following commands in the terminal:
```shell
cd ~/.vim/bundle
git clone git://github.com/entrez/roku.vim.git
```
