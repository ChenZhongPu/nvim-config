git clone https://github.com/fladson/vim-kitty.git /tmp/vim-kitty
mkdir -p ~/.config/nvim/syntax
mkdir -p ~/.config/nvim/ftdetect
mkdir -p ~/.config/nvim/ftplugin
mv /tmp/vim-kitty/syntax/* ~/.config/nvim/syntax
mv /tmp/vim-kitty/ftdetect/kitty.vim ~/.config/nvim/ftdetect
mv /tmp/vim-kitty/ftplugin/kitty.vim ~/.config/nvim/ftplugin
rm -rf /tmp/vim-kitty
