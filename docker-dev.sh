sudo apt update 
sudo apt install sudo git npm python python3 neofetch -y
sudo apt install -y qemu qemu-kvm libvirt-daemon libvirt-clients bridge-utils virt-manager
        sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
        sudo wget -O code.deb "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
        sudo apt install -y ./google-chrome-stable_current_amd64.deb
        sudo apt install -y ./code.deb
        
   wget -O astudio.tar.gz "https://r3---sn-42u-i5oer.gvt1.com/edgedl/android/studio/ide-zips/2022.2.1.18/android-studio-2022.2.1.18-linux.tar.gz?cms_redirect=yes&mh=Gl&mip=1.55.223.190&mm=28&mn=sn-42u-i5oer&ms=nvh&mt=1682782102&mv=m&mvi=3&pl=24&rmhost=r1---sn-42u-i5oer.gvt1.com&shardbypass=sd&smhost=r2---sn-42u-i5oll.gvt1.com"
   tar xf astudio.tar.gz
   cd android-studio/bin
   sudo adduser ubuntu kvm
   sudo chown -R ubuntu:ubuntu /dev/kvm
   

   code
   ./studio.sh
        
