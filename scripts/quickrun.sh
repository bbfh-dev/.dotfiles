#!/usr/bin/env bash

if [ ! -d ~/.config/quickrun ] ; then
    mkdir ~/.config/quickrun
fi

filepath=~/.config/quickrun/$(echo -n $(pwd) | base64).sh

if [ -f $filepath ]; then
    sh $filepath
else
    touch $filepath
    echo -e "#!/usr/bin/env bash\n" > $filepath
    nvim $filepath
    echo "Created configuration. Run the script again to use it."
fi
