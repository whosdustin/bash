# Bash Configs

### File description
- __README.md__ - This file
- __.aliases__ - alias definitions
- __.profile__ - bash design and colors
- __.environments__ - basic environment settings
- __.bashrc__ - the main RC file



## Terminal View
Design inspired by [Wild Cherry](https://github.com/mashaal/wild-cherry)
![Terminal](img/terminal.png)

### Branch  Emojis
> 👍 Clean

> 💩 Dirty

## Install
``` shell
$ git clone https://github.com/whosdustin/bash.git .bash
```
In the computer root add a `.bash_profile` and place the following code inside.
```
if [ ! -f $HOME/.bashrc ]; then
  source $HOME/.bash/.bashrc
fi
```

Close your terminal and reopen.

**Done.**

The `.private` file is for you to add TOKENS such as Github.
