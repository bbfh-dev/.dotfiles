#!/usr/bin/env bash

selected=$(find ~/public/git/local ~/public/bookmarks -mindepth 1 -maxdepth 1 -type d,l | fzf)

if [[ -z $selected ]]; then
	exit 0
fi

if [[ $selected == *.d ]]; then
	selected=$(find $selected -mindepth 1 -maxdepth 1 -type d,l | fzf)
fi

if [[ $selected != */bookmarks/LATEST ]]; then
	rm -rf ~/public/bookmarks/LATEST
	ln -s $selected ~/public/bookmarks/LATEST
fi
cd -P $selected
