# Install dependencies
SYSTEM=`uname -s`
if [SYSTEM = "Linux"] ; then
    echo "Linux"
    sudo apt-get install git vim ctags
fi

# Clone Vundle.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install plugins
vim +PluginInstall +qall
echo 'Done!'
