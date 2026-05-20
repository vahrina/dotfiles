ff() {
  local root="${1:-.}"
  local file

  file=$(
    fd --type f \
      --hidden \
      --follow \
      --exclude .git \
      --exclude node_modules \
      . "$root" \
      | fzf \
      --prompt '  file  ' \
      --preview '/bin/batcat --color=always --theme=base16 --style=numbers,changes --line-range=:300 {}'  \
      --preview-window 'right:60%:wrap'
    ) || return

    [ -n "$file" ] && nvim -- "$file"
  }

