# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

### PS1
if [ "$(whoami)" = "root" ]; then
  export PS1="\[\033]0;\u@\h:\w\007\]\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[00m\] "
else
  export PS1="\[\033]0;\u@\h:\w\007\]\[\033[01;32m\]\u@\h\[\033[01;34m\] \W \$\[\033[00m\] "
fi
### PS1

#### Binds
bind 'set editing-mode vi'
bind 'set completion-ignore-case on'
bind 'TAB: menu-complete'
bind '"\e[Z": menu-complete-backward'
bind '"²": complete'
bind -x '"": clear'
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
#### Binds

#### Exports
## Eternal History
# https://stackoverflow.com/a/19533853
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
export HISTFILE=~/.bash_eternal_history
#PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ;} history -a"
#export HISTCONTROL=ignoredups:erasedups
## Eternal History

export _JAVA_AWT_WM_NONREPARENTING=1
#### Exports

### SHOPT
shopt -s autocd
shopt -s cdspell
shopt -s cmdhist
shopt -s expand_aliases
shopt -s direxpand
shopt -s extglob
### SHOPT

### Variables
#if command -v nvim &>/dev/null; then
#	export EDITOR=nvim
#elif command -v pyvim &>/dev/null; then
#	export EDITOR=pyvim
#elif command -v vim &>/dev/null; then
#	export EDITOR=vim
#fi
export EDITOR=vim
export VISUAL="${EDITOR}"
export PATH="${HOME}/.local/bin:${PATH}"
export PATH="${HOME}/.cargo/bin:${PATH}"
export RANGER_LOAD_DEFAULT_RC=FALSE
### Variables

#### Aliases
source /usr/share/autojump/autojump.bash

if command -v anbox&>/dev/null ; then
  alias startanbox='anbox launch --package=org.anbox.appmgr --component=org.anbox.appmgr.AppViewActivity'
fi
if command -v exa >&/dev/null ; then
  alias ls=exa
  alias la='ls -a'
else
  alias ls='ls --color=auto'
  alias la='ls -A'
fi
alias ll='ls -l'
alias l='ls -F'
# alias vim=nvim
alias ef=e-file
alias gdiff='diff --color -Nu'
alias grep='grep --color'
alias sudo=doas
alias r=ranger
alias :q=exit
alias a='tmux a||tmux'
alias n='neofetch'
alias ytdl='yt-dlp'
alias gh='history | grep'
alias uemerge='doas emerge --autounmask --autounmask-write'
if [ "$TERM" = "xterm-kitty" ]; then
  alias ytfzf='ytfzf -t --thumb-viewer=kitty'
else
  alias ytfzf='ytfzf -t --thumb-viewer=chafa'
fi
alias dw='dbus-run-session /usr/bin/dwl -s somebar'
alias sway='dbus-run-session sway --unsupported-gpu'
alias journal='$EDITOR /srv/Journal/Daily/$(date "+%Y-%m-%d.md")'
alias bucket='$EDITOR /srv/user/Bucket.md'
alias reboot='reboot || loginctl reboot'
alias suspend='doas chvt 5 && doas loginctl suspend'
#### Aliases
#### Functions
vhich(){
  "${EDITOR:-vi}" "$(which "$1")"
}
fwhich(){
  file "$(which "$1")"
}
#### Functions

#### Transparency
test "$TERM" = "st-256color" && command -v transset &>/dev/null && transset 0.80 -i $WINDOWID >/dev/null
#### Transparency

#### Bedrock aliases and defines
if command -v brl &>/dev/null ; then
  for strata in /bedrock/strata/*; do
    export $(basename $strata)="$strata"
  done
  export current="/bedrock/strata/$(brl which $SHELL)"
fi
#### Bedrock aliases and defines

#### Productivity features
# If not home, go home
test "$(dirname "$PWD")" = /home && cd
# Delete unnecesairy files in home
## Tell user about status
if [ "$TERM" = "xterm-kitty" ]||[ "$TERM" = "alacritty" ]; then
  # Welcome the user
  if [ "$USER" = "root" ]; then
    clear
    figlet "BEHOLD THE POWER OF ROOT"
  elif [ "$USER" = "jbara" ]; then
    figlet 'WELCOME BACK HERO'
    task
  elif [ "$USER" = "herbalist" ]; then
    figlet 'Healing Time'
    task
  fi
fi
# Save currently used display
echo "$WAYLAND_DISPLAY" > "$HOME"/.cache/wld
#### Productivity features
