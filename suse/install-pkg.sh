if [ `id -u` -ne 0 ]; then
    echo "This script must be run as root" > /dev/stderr
    exit 1
fi
PACKAGE_LIST_SUSE="
libnotify-tools
qalculate
python-wxWidgets
python3-pip
pdftk
ack
acpi
alsa-plugins-pulse-32bit
aspell
autoconf
automake
chromium
chromium-pdf-plugin
comix
comix-lang
dkms
dolphin-plugins
ebview
ekiga
emacs
emacs-el
fcitx
fcitx-chewing
fcitx-devel
fcitx-mozc
ffmpegthumbnailer
filelight
gcc
ghc
git
gpg2
gpick
gpick-lang
hg
htop
imagewriter
kde-mplayer-thumbnailer
kernel-source
kernel-syms
kffmpegthumbnailer
libchewing-devel
libqt4-devel
make
nodejs
nodejs-devel
p7zip
pidgin
qtcurve
rhino
rsync
shutter
shutter-lang
smplayer
smplayer-lang
smplayer-skins
smplayer-themes
smplayer2
smplayer2-lang
stardict
synapse
synapse-lang
texlive
texlive-xecjk
texlive-multirow
tmux
tig
umplayer
umplayer-lang
umplayer-themes
vlc
vlc-codecs
wine
xclip
xkill
yakuake
zanity
zsh
clisp
clisp-doc
sbcl
python3-pip
"
# replace newline with spaces
PACKAGE=$(echo $PACKAGE_LIST_SUSE | tr -s '\n' ' ')
zypper in ${PACKAGE}
npm install -g hexo tern
npm -g install js-beautify

# powerline font patch

# wget https://raw.githubusercontent.com/Lokaltog/vim-powerline/develop/fontpatcher/fontpatcher
# wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf
# chmod +x ./fontpacher
# ./fontpacher ./PowerlineSymbols.otf
# cp ./PowerlineSymbols.otf /usr/share/fonts
# fc-cache -vf


# edit font config file
while true; do
    read -p "Do you want to edit font config file?" yn
    case $yn in
        [Yy]* ) emacs /etc/fonts/conf.d/58-suse-post-user.conf; /usr/sbin/fonts-config ; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

