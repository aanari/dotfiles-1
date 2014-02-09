OS=`uname`

export LS_OPTIONS='--color=auto'
if [[ "$OS" == "Darwin" ]]; then
  PORTSBIN="/usr/local/bin/"
  DIRCOLORS="$PORTSBIN/gdircolors"
  alias ls="$PORTSBIN/gls $LS_OPTIONS "
else
  DIRCOLORS='/usr/bin/dircolors'
  alias ls="ls $LS_OPTIONS "
fi

eval `$DIRCOLORS ~/.dir_colors`

if [[ "$OS" == "Darwin" ]]; then
  export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home/
fi

export CLI_COLOR='Yes'
set -o vi
alias grep='grep --color=auto'
alias gvim='gvim -geom 82x35'
alias hist='grep '$1' $HOME/.zsh_history'
alias mem='free -m'
alias rmdir='rm -rf '
alias sU='svn up'
alias la='ls -al'
alias f='find |grep'
alias lsd='ls -ld *(-/DN)'
alias c='clear'
alias cc='c;c;c;c'
alias p='pushd .'
alias u='popd'
alias td='tmux detach'
alias tl='tmux attach -t leftscr'
alias tr='tmux attach -t rightscr'
alias t1='tmux attach -t t1'
alias t2='tmux attach -t t2'
alias ll='ls -alh'
alias vi='vim'
alias v='vim'
alias n='notes '
alias hist="git --no-pager log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short"
alias a='ack'
alias pct='perl -Ilocallib/lib/perl5 -Ilib'

rationalise-dot() {
    if [[ $LBUFFER = *.. ]]; then
    LBUFFER+=/..
    else
    LBUFFER+=.
    fi
}
zle -N rationalise-dot
bindkey . rationalise-dot

