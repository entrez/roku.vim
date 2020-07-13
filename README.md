<div align="center">
    <img src="https://camo.githubusercontent.com/36ce7789e630a9d4f51146d6e1a67c0a7d450e53/68747470733a2f2f3078302e73742f697455482e706e67" alt="roku.vim logo" />
</div>

## roku.vim

### overview

a vim plugin for roku development - provides brightscript language support (syntax highlighting, folding, section movement, indentation, etc) as well as channel installation/packaging from within vim.

![roku.vim screenshot](https://user-images.githubusercontent.com/40038830/63709503-0a9d8d80-c805-11e9-823e-82a8338a8df0.png)

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
