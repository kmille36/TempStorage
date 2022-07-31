clear
echo "Script by fb.com/thuong.hai.581"
echo "Transform any xfce4 into windows 10"
echo "Install neeeded packages"
sudo apt update  > /dev/null
sudo wget http://archive.kali.org/kali/pool/main/k/kali-undercover/kali-undercover_2021.4.0_all.deb  > /dev/null
sudo apt install ./kali-undercover_2021.4.0_all.deb -y > /dev/null
echo "Applying windows 10 theme"
kali-undercover
