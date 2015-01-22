#!/bin/bash
# Installation on Vim Janus Script from the repository

echo "Vim Janus Installator."
actual_path=$(pwd)

if [ -e "$actual_path/.vimrc.after" ]
then
	echo "Installing Vim Janus"
else
	echo "Please run this script from within the vimjanus folder"
	exit 1
fi

# Move the folder to the home path
echo "Moving the files to the HOME Folder..."

if [ -e "$HOME/.vim" ]
then
    echo "Removing actual .vim folder"
    rm "$HOME/.vim/" -Rf
fi

mv .vim "$HOME" -f
mv .vimrc.after "$HOME" -f
mv .vimrc.before "$HOME" -f
echo "Creating Symbolic links to the .vimrc and .gvimrc files"
cd "$HOME"
ln -sf "$HOME/.vim/janus/vim/vimrc" .vimrc
ln -sf "$HOME/.vim/janus/vim/gvimrc" .gvimrc
echo "Deleting vimjanus repository folder"
rm "$actual_path" -Rf
echo "All done, have fun!"
