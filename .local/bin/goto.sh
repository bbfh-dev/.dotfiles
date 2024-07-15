#!/usr/bin/env bash

move() {
	if [[ -e $1 ]]; then
		mv $1 $2
	fi
}

goto() {
	# mkdir -p ~/.local/share/scripts
	# move ~/.local/share/scripts/4th ~/.local/share/scripts/5th
	# move ~/.local/share/scripts/3rd ~/.local/share/scripts/4th
	# move ~/.local/share/scripts/2nd ~/.local/share/scripts/3rd
	# move ~/.local/share/scripts/1st-LATEST ~/.local/share/scripts/2nd
	# ln -s $1 ~/.local/share/scripts/1st-LATEST
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
	selected=$(find ~/.local/share/scripts -mindepth 1 -maxdepth 1 -type d,l | fzf --preview='readlink -f {}; ls -a $(readlink -f {})')
	goto $selected
	return
fi

echo "Use one of the following commands: project, recent"
