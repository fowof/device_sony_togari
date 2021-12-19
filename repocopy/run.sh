
_DIR_DEVICE="$(cd "$(dirname "${BASH_SOURCE:-$0}")"; cd ../; pwd)"
_DIR_REPOROOT="$(cd "$_DIR_DEVICE"; cd ../../../; pwd)"

[ "$(pwd)" = "$_DIR_REPOROOT"     ] || cd "$_DIR_REPOROOT"

_DIR_DEVICE=${_DIR_DEVICE#$_DIR_REPOROOT}
_DIR_DEVICE=${_DIR_DEVICE#/}

for src in $(find "${_DIR_DEVICE}/repocopy" -mindepth 2 -type f)
do
  dst="${src#${_DIR_DEVICE}/repocopy/}"
  if [ -s "$src" ]; then
    cp "$src" "$dst"
  else
    [ -f "$dst" ] && rm "$dst"
  fi
done
