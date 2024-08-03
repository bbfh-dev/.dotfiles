#!/usr/bin/env bash

move() {
	if [[ -e $1 ]]; then
		mv $1 $2
	fi
}

goto() {
	# ln -s $1 ~/.local/share/scripts/latest
	cd -P $1
}

if [[ $1 = "project" ]]; then
	selected=$(find ~/public/git/local ~/public/git/github ~/public/bookmarks -mindepth 1 -maxdepth 1 -type d,l | fzf --preview="ls -a {}")
	if [[ -z $selected ]]; then
		return
	fi

	if [[ $(basename $selected) == +* || $selected == *.d ]]; then
		selected=$(find $selected -mindepth 1 -maxdepth 1 -type d,l | fzf --preview="ls -a {}")
	fi

	# Check if it's a bare repository
	if [[ -f $selected/HEAD ]]; then
		cd -P $selected
		branch=$(git worktree list | fzf --preview="ls -a {}")
		read -r first_argument _ <<< "$branch"
		goto $first_argument
	else
		goto $selected
	fi

	return
fi

if [[ $1 = "recent" ]]; then
	cd -P ~/.local/share/scripts/latest
	return
fi

echo "Use one of the following commands: project, recent"
