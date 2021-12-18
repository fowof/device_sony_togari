
for src in $(find ${_DIR_DEVICE}/repocopy -type f)
do
  dst="${src#${_DIR_DEVICE}/repocopy/}"
  if [ -s "$src" ]; then
    cp "$src" "$dst"
  else
    [ -f "$dst" ] && rm "$dst"
  fi
done
