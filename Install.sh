#!bin/bash 

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
bash PushToLocal.sh
vim +PluginInstall +qall
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --all 
cd -
vim +PluginInstall +qall
echo "DONE!"

