#Nuage Rhel 7.1 Mirror: http://mirrors.mv.nuagenetworks.net/centos-7.1/os/x86_64/

kernel_version=`uname -r`
delim="############################################################"

# Nuage repo
echo -e "[nuage-centos-7.1-server-mirror]\nname=nuage-centos-7.1-mirror\nbaseurl=http://mirrors.mv.nuagenetworks.net/rhel-7.1/rhel-7-server-eus-rpms/\ngpgcheck=0\nenabled=1" > /etc/yum.repos.d/nuage-el7.1-mirror.repo
echo $delim
echo "Creating Nuage Repo =====> /etc/yum.repos.d/nuage-el7.1-mirror.repo"    
echo $delim
echo ""

echo $delim
echo "Installing Basic Dependencies"    
echo $delim
echo ""

#install basic dependencies
yum -y install epel-release
yum -y install python-docutils uuid kernel-$kernel_version \
    tcpdump iptables-devel net-tools\
    protobuf-c-devel nfs-utils cscope vim wget openssl-devel \
    gcc make python-devel openssl-devel autoconf automake rpm-build \
    redhat-rpm-config libtool libxml2-devel iproute cryptsetup golang \
    libvirt libvirt-devel kernel-devel-$kernel_version \
    kernel-headers-$kernel_version perl-Sys-Syslog python-ipaddr \
    python-lxml pytest python-pip scapy python-six perl\(JSON\) \
    python-setproctitle python-twisted-core conntrack gcc-c++ libgcrypt-devel \
    jsoncpp-devel gperftools pprof hping3 libpcap libpcap-devel docker \
    perl-devel expect ntp yasm docker ipset redis libcap-ng-devel nss curl libcurl zsh \
    asciidoc xmlto docbook2X getopt

yum clean all 
yum -y groupinstall "Development Tools" 
yum -y install gettext-devel openssl-devel perl-CPAN perl-devel zlib-devel 
yum -y install xorg-x11-xauth xterm libXt-devel libXaw-devel

export PATH=$PATH:$HOME/bin:/usr/local/bin:/usr/local/git/bin

export OVS_RUNDIR=/var/run/openvswitch

echo $delim
echo "Installing Emacs"    
echo $delim
echo ""

#install emacs
yum -y install gcc make ncurses-devel giflib-devel libjpeg-devel libtiff-devel libpng libpng-devel
cd /usr/local/src
wget http://ftp.gnu.org/pub/gnu/emacs/emacs-25.3.tar.xz
cd emacs-25.3
./configure
make && make install
cd ~/

echo $delim
echo "Installing Spacemacs"    
echo $delim
echo ""

#install spacemacs
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

echo $delim
echo "Installing Powerline"    
echo $delim
echo ""


#installing powerline fonts
# clone
cd /usr/local/src
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts
cd ~/

echo $delim
echo "Installing Silver Searcher"    
echo $delim
echo ""


#install silver searcher
cd /usr/local/src
git clone https://github.com/ggreer/the_silver_searcher.git
cd the_silver_searcher
 ./build.sh
make install
cd ~/



#install dotfiles
echo "Post install instructions: "
echo "Get dotfiles: git clone git@github.mv.usa.alcatel.com:saketkus/dotfiles.git"
echo "Create soft links:"
echo "    ln -s ~/dotfiles/zshrc ~/.zshrc"
echo "    ln -s ~/dotfiles/spacemacs ~/.spacemacs"