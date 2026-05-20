# -- oh my zsh
export ZSH="$HOME/.oh-my-zsh"

# -- zstyles & performance
zstyle ':omz:update' mode auto
zstyle ':omz:plugins*' lazy yes
zstyle ':omz:lib:git' disable-status true
DISABLE_UNTRACKED_FILES_DIRTY=1
DISABLE_AUTO_TITLE="true"

# -- history
HIST_STAMPS="dd.mm.yyyy"
HISTSIZE=5000
HISTFILESIZE=10000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS

# -- plugins
plugins=(
  git
  gitfast
  colorize
  history-substring-search
  ssh
  zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# -- load config
for f in $HOME/.config/zsh/{env.zsh,alias.zsh,keybind.zsh,functions/*.zsh}; do source $f; done

# rest stuff
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
[[ $PWD == /mnt/c* ]] && cd ~

