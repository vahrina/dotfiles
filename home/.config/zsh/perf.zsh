# zsh $HOME/.config/zsh/perf.zsh
zmodload zsh/datetime
for f in $HOME/.config/zsh/{alias.zsh,env.zsh,keybind.zsh,functions/*.zsh}; do
  t=$EPOCHREALTIME
  source $f
  printf "%.4fs  %s\n" $(( EPOCHREALTIME - t )) $f
done
