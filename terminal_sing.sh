#!/bin/bash

function sing_lyric() {
  if which espeak; then
    espeak $2
  elif which say; then
    say $2
  else
    echo "You need to install say (Mac) or espeak (Unix)"
  fi
}

sing_lyric < <(curl -sSL https://raw.githubusercontent.com/bratanon/terminal-sing/master/lyrics/$0.lyric)
