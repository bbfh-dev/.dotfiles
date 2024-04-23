#!/usr/bin/env bash

selected=$(find ~/public/git/local ~/public/bookmarks -mindepth 1 -maxdepth 1 -type d,l | fzf)

if [[ -z $selected ]]; then
	exit 0
fi

if [[ $selected == *.d ]]; then
	selected=$(find $selected -mindepth 1 -maxdepth 1 -type d,l | fzf)
fi

if [[ -f $selected/HEAD ]]; then
	cd -P $selected
	branch=$(git worktree list | fzf)
	read -r first_argument _ <<<"$branch"

    rm -rf ~/public/bookmarks/LATEST
    ln -s $first_argument ~/public/bookmarks/LATEST
	cd -P $first_argument
else
	if [[ $selected != */bookmarks/LATEST ]]; then
		rm -rf ~/public/bookmarks/LATEST
		ln -s $selected ~/public/bookmarks/LATEST
	fi

	cd -P $selected
fi
