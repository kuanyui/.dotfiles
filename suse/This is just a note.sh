if [ `id -u` -ne 0 ]; then
    echo "this script must be run as root" > /dev/stderr
    exit 1
fi

# get opensuse release
RELEASE=`cat /etc/SuSE-release | sed -n "s/VERSION = \(.*\)$/\1/p"`

# add repositories
sudo zypper addrepo http://ftp.gwdg.de/pub/linux/packman/suse/$RELEASE/ packman
sudo zypper addrepo http://download.opensuse.org/repositories/home:lzh9102/openSUSE_${RELEASE}/home:lzh9102.repo

wget http://opensuse-community.org/codecs-kde.ymp
/usr/share/applications/yast2-metapackage-handler codecs-kde.ymp

zypper addrepo -r http://packman.inode.at/suse/13.1/packman.repo
zypper addrepo -r http://www.opensuse-guide.org/repo/13.1/libdvdcss.repo

sudo zypper refresh

zypper install libxine2-codecs k3b-codecs ffmpeg lame gstreamer-0_10-plugins-bad gstreamer-0_10-plugins-ugly gstreamer-0_10-plugins-ugly-orig-addon gstreamer-0_10-plugins-ffmpeg libdvdcss2 qwinff
# install qwinff


cmake
ag
nethog


# 3rd repo
retroshare
qwinff
skype
virtualbox
dropbox
copy

kfaenza
faenza

# stardic和ebview字典檔

dropbox for dolphin

# install essential package first
sudo zypper in git zsh emacs tmux
sudo chsh /bin/zsh

su echo -e "\nblacklist pcspkr" >>  /etc/modprobe.d/50-blacklist.conf




# parser for https://www.virtualbox.org/wiki/Downloads
#            https://www.virtualbox.org/wiki/Linux_Downloads
http://download.virtualbox.org/virtualbox/LATEST.TXT
http://download.virtualbox.org/virtualbox/4.3.4/VirtualBox-4.3-4.3.4_91027_openSUSE123-1.x86_64.rpm
ask_if_modify_monospace_config() {
    
}
