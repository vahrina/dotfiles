set -a
typeset -U path

# editor/visual
EDITOR=$([[ -n $SSH_CONNECTION ]] && echo vim || echo nvim)
VISUAL=$EDITOR

# go bin
GOROOT="/usr/local/go"
GOPATH="/usr/local/go/packages"
path=(
  "$HOME/.local/bin"
  "$HOME/.cargo/bin"
  "$GOROOT/bin"
  "$GOPATH/bin"
  "$PNPM_HOME/bin"
  $path
)

# pager
COLORTERM=truecolor
GROFF_NO_SGR=1
MANPAGER=less

# pager colors
sgr0=$(tput sgr0)
LESS_TERMCAP_mb=$(tput bold; tput setaf 183)
LESS_TERMCAP_md=$(tput bold; tput setaf 183)
LESS_TERMCAP_me=$sgr0
LESS_TERMCAP_se=$sgr0
LESS_TERMCAP_so=$(tput setaf 236; tput setab 183)
LESS_TERMCAP_ue=$sgr0
LESS_TERMCAP_us=$(tput bold; tput setaf 217)
LESS_TERMCAP_mr=$(tput rev)
LESS_TERMCAP_mh=$(tput dim)

# nvm
NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# pnpm
PNPM_HOME="/home/vah/.local/share/pnpm"

# fonts
TYPST_FONT_PATHS="/mnt/c/Users/vah/AppData/Local/Microsoft/Windows/Fonts"

set +a
