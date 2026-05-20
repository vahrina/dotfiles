rcpub() {
  git remote remove origin 2>/dev/null
  gh repo create "$(basename $PWD)" --public --source=. --remote=origin --push
}
