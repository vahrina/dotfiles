rcpri() {
  git remote remove origin 2>/dev/null
  gh repo create "$(basename $PWD)" --private --source=. --remote=origin --push
}
