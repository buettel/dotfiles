## Installing Zsh
You can install Zsh like everything else:

macOS (with brew): brew install zsh
Then, run it in a terminal by typing `sudo chsh -s $(which zsh)`.

## Zsh Config Files
To configure Zsh for your userâ€™s session, you can use the following files:

- $ZDOTDIR/.zshenv
- $ZDOTDIR/.zprofile
- $ZDOTDIR/.zshrc
- $ZDOTDIR/.zlogin
- $ZDOTDIR/.zlogout
In case you wonder what $ZDOTDIR stands for, weâ€™ll come back to it soon.

Zsh read these files in the following order:

- .zshenv - Should only contain userâ€™s environment variables.
- .zprofile - Can be used to execute commands just after logging in.
- .zshrc - Should be used for the shell configuration and for executing commands.
- .zlogin - Same purpose than .zprofile, but read just after .zshrc.
- .zlogout - Can be used to execute commands when a shell exit.
Weâ€™ll use only .zshenv and .zshrc in this article.

## Zsh Config Path
By default, Zsh will try to find the userâ€™s configuration files in the $HOME directory. You can change it by setting the environment variable $ZDOTDIR.

Personally, I like to have all my configuration files in $HOME/.config. To do so:

- I set the variable $XDG_CONFIG_HOME as following: export XDG_CONFIG_HOME="$HOME/.config".
- I set the environment variable $ZDOTDIR: export ZDOTDIR="$XDG_CONFIG_HOME/zsh".
- I put the file .zshrc in the $ZDOTDIR directory.
Most software will use the path in $XDG_CONFIG_HOME to install their own config files. As a result, youâ€™ll have a clean $HOME directory.

Unfortunately, the file .zshenv needs to be in your home directory. Itâ€™s where youâ€™ll set $ZDOTDIR. Then, every file read after .zshenv can go into your $ZDOTDIR directory.

## Zsh Basic Config
Environment Variables
As we saw, you can set the environment variables you need for your userâ€™s session in the file $HOME/.zshenv. This file should only define environment variables.

For example, you can set up the XDG Base directory there, as seen above:
```
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/cache"
````
You can also make sure that any program requiring a text editor use your favorite one:

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

export HISTFILE="$ZDOTDIR/.zhistory"    # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file
I already explained the first line. For the other ones, they will:
