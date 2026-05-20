hugo-fast() {
  local f='hugo.log'
  [[ -f $f && -w $f ]] || { printf "[err] created missing '%s'\n" "$f" >&2; touch "$f"; }
  hugo server --noHTTPCache -D > "$f" 2>&1 &
  printf "[suc] logging to: '%s'\n" "$f"
}
