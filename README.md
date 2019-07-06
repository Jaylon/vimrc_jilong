 .vimrc file for personal use
 
 Support:
 1. Gtags - Global
 2. Ctags + Cscope
 3. bundle
 4. airline, tools bar scheme
 5. gruvbox, vim color scheme
 6. NERD Tree
 7. Tag List
 
---------------
 First time to run this .vimrc script should do: 
 1. Backup original vim files. 
 $ mv ~/.vim ~/vim_bk && mv ~/.vimrc vimrc_bk
 
 2. Create new folder
 $ mkdir -p ~/.vim/plugin && mkdir -p ~/.vim/bundle
 
 3. close this file to local.
 $ git clone https://github.com/Jaylon/vimrc_jilong.git
 
 4. Change name
 $ mv vimrc_jilong ~/.vimrc
 
 5. Set up Vundle:  
 git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
 
 6 Launch vim and run :PluginInstall
 
 7 If you want to use global - Gtags
 
 Method 1 only for Ubuntu:  
 $ sudo apt-get install global
 $ cp /usr/share/vim/addons/plugin/gtags*.vim ~/.vim/plugin
 
 Method 2:
 $ wget http://tamacom.com/global/global-6.6.3.tar 
 un-tar and cd global-6.6.3, see INSTALL
 $ ./configure
 $ sudo make && make install
 $ mkdir ~/.vim/plugin
 $ cp gtags.vim gtags-cscope.vim ~/.vim/plugin 
