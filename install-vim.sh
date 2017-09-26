#! /usr/bin/sh

echo_log() {
	tput setaf 6;
	echo [`date +'%Y-%m-%d %h:%M:%S'`] $1;
	tput sgr0;
}
current_dir=`pwd`
mkdir -p ~/software && cd ~/software

# 安装依赖包
echo_log 'Dependency pack install begin ...'
yum install -y git gcc gcc-c++ wget ncurses-devel zip unzip cmake python-devel ctags cscope
echo_log 'Dependency pack install success'

if ! vim --version | grep "VIM - Vi IMproved 8.*"
then
	# 安装vim8.0
	echo_log 'vim 8.0 install begin ...'
	wget https://github.com/vim/vim/archive/master.zip
	unzip master.zip && cd vim-master/src
	./configure --with-features=huge --enable-multibyte --enable-rubyinterp=yes --enable-pythoninterp=yes --with-python-config-dir=/usr/lib64/python2.7/config --enable-cscope --prefix=/usr
	make VIMRUNTIMEDIR=/usr/share/vim/vim80
	make && make install
	echo_log 'vim 8.0 install success'
else
	echo_log "vim 8.0+ has been installed"
fi

cp $current_dir/vimrc ~/.vimrc
mkdir ~/.vim
cp -R $current_dir/colors ~/.vim/


# 安装vim插件
echo_log 'Vundle install begin ...'
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim -c "BundleInstall" -c "q" -c "q"
echo_log 'Vundle install success'

# 编译安装YouCompleteMe
echo_log 'YouCompleteMe install begin ...'
#git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe
#git submodule update --init --recursive
./install.py --clang-completer
cp ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py ~/
echo_log 'YouCompleteMe install success ...' 

cd ~
sudo chown -R "$USER":"$USER" ~/.vim