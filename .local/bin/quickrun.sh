#!/usr/bin/env bash

if [ ! -d ~/.config/quickrun ]; then
	mkdir ~/.config/quickrun
fi

if [ "$#" -eq 1 ]; then
	if [ $1 = "--parent" ]; then
		original=$(pwd)
		cd ..
		filepath=~/.config/quickrun/$(echo -n $(pwd) | base64).sh
		cd $original
	fi
	if [ $1 = "--modify" ]; then
		filepath=~/.config/quickrun/$(echo -n $(pwd) | base64).sh
		touch $filepath
		echo -e "#!/usr/bin/env bash\n" >$filepath
		nvim $filepath
		echo "Modified configuration. Run the script again to use it."
	fi
else
	filepath=~/.config/quickrun/$(echo -n $(pwd) | base64).sh
fi

if [ -f $filepath ]; then
	sh $filepath
else
	touch $filepath
	echo -e "#!/usr/bin/env bash\n" >$filepath
	nvim $filepath
	echo "Created configuration. Run the script again to use it."
fi
