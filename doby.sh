#!/bin/bash

function terminal_sing() {
  if which espeak; then
    espeak $1
  elif which say; then
    say $1
  else
    echo "You need to install say (Mac) or espeak (Unix)"
  fi
}

terminal_sing < <(curl -fsSL https://raw.githubusercontent.com/bratanon/terminal-sing/master/lyrics/$1.lyric)