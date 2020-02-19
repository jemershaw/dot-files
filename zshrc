[ -z "$PS1" ] && return

if [[ -s ~/.zshrc.local ]]; then
  source ~/.zshrc.local
fi

export LANG=en_US.UTF-8

# Source Prezto if ZSH has the correct version
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]] && [[ $ZSH_VERSION > 4.3.17 ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
  zstyle ':prezto:module:history-substring-search' case-sensitive 'yes'
fi

# Customize to your needs...

# Set FPATH(For Autocompletion)
if [[ -S ~/.zsh_completion ]];
then
	fpath=($HOME/.zsh_completion $fpath )
fi

# Set my custom Theme
 autoload -Uz promptinit
  promptinit
  prompt sorin

# Set the manta settings
if [ -f ~/Manta/default.manta ]; then
  source ~/Manta/default.manta
fi

# Ansible fix for osx
if [[ "$(uname -s)" == "Darwin" ]]; then
  export ansible_python_interpreter=/usr/local/opt/python/bin/python2.7
fi

#alias
alias vi='vim'

sharesession() {
  tmux -S /tmp/tmux-shared-$USERNAME-$RANDOM new -s shared
}

# Set Golang information
export GOPATH=$HOME/go
export PATH=$HOME/.cargo/bin:/opt/local/go/bin:$PATH:$GOPATH/bin

# Editor
export EDITOR=vi
export VIEWER=vi

# ZSH Settings

if [[ $ZSH_VERSION > 4.3 ]]; then
	HISTFILE="$HOME/.zhistory"
	HISTSIZE=10000
	SAVEHIST=10000
	setopt BANG_HIST                 # Treat the '!' character specially during expansion.
	setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
	setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
	setopt SHARE_HISTORY             # Share history between all sessions.
	setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
	setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
	setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
	setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
	setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
	setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
	setopt HIST_VERIFY               # Do not execute immediately upon history expansion.
	setopt HIST_BEEP                 # Beep when accessing non-existent history.

	bindkey '^[[A' history-substring-search-up
	bindkey '^[[B' history-substring-search-down
	bindkey -M vicmd 'j' history-substring-search-up
	bindkey -M vicmd 'k' history-substring-search-down

	if [[ -f ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh ]]
	then
		source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
	fi
	if [[ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]
	then
		source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
	fi
	if [[ -f ~/.zsh/zsh-completions/zsh-completions.plugin.zsh ]]
	then
		source ~/.zsh/zsh-completions/zsh-completions.plugin.zsh ]]
	fi


	# Load and initialize the completion system ignoring insecure directories with a
	# cache time of 20 hours, so it should almost always regenerate the first time a
	# shell is opened each day.
	autoload -Uz compinit
	_comp_files=(${ZDOTDIR:-$HOME}/.zcompdump(Nm-20))
	if (( $#_comp_files )); then
		compinit -i -C
	else
		compinit -i
	fi
	unset _comp_files

	zstyle ':completion::complete:*' use-cache on
fi
