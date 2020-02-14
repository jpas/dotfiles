if ! have direnv; then
  return
fi

eval "$(direnv hook bash)"
