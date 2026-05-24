nvim() {
  if ! pgrep -f "UNIX-LISTEN:/tmp/discord-ipc-0" >/dev/null; then
    [ -e /tmp/discord-ipc-0 ] && rm -f /tmp/discord-ipc-0
    socat UNIX-LISTEN:/tmp/discord-ipc-0,fork \
      EXEC:"npiperelay.exe -ei -s //./pipe/discord-ipc-0",nofork &
  fi
  command nvim "$@"
}
