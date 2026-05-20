urand() {
  head -c 32 <(tr -dc 'A-F0-9' < /dev/urandom)
}
