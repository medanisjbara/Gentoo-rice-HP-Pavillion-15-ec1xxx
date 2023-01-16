#!/bin/sh

# A script that fetches important scripts and binaries from upstream

## grimshot ##
wget "https://raw.githubusercontent.com/swaywm/sway/master/contrib/grimshot" -O /usr/local/bin/grimshot
mkdir -p /usr/local/share/man/man1
wget "https://raw.githubusercontent.com/swaywm/sway/master/contrib/grimshot.1" -O /usr/local/share/man/man1/grimshot.1

## cliphist ##
ver=0.3.1
wget "https://github.com/sentriz/cliphist/releases/download/v$ver/v$ver-linux-amd64" -O /usr/local/bin/cliphist
wget "https://raw.githubusercontent.com/sentriz/cliphist/master/contrib/cliphist-fzf" -O /usr/local/bin/cliphist-fzf

chmod +x /usr/local/bin/*
