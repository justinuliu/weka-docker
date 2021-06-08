echo $PATH
echo $HOME
if [ -f $HOME/.zshrc ]; then
    source $HOME/.zshrc
fi
if [ -d /opt/X11/bin ]; then
    PATH=$PATH:/opt/X11/bin
fi
echo $PATH
bash startup.sh
echo ''
echo 'QUITAPP\n'
