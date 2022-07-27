clear
echo "Script by fb.com/thuong.hai.581"
echo "Support: Ubuntu/Centos/Debian"
echo "Finding your linux distro"
if command -v apt-get >/dev/null; then
      	echo "Your distro is Ubuntu or Debian"
      	sleep 1
        echo "Updating your system"
       	sudo apt-get update -y
        sudo apt-get install wget -y
        clear
        echo "Installing google-chrome"
        wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
        sudo apt install -y ./google-chrome-stable_current_amd64.deb
elif command -v yum >/dev/null; then
  	echo "Your distro is CentOS"
	sleep 1
        echo "Updating your system"
        sudo yum update -y
        yum install wget -y
        clear
        echo "Installing google-chrome"
        wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
        sudo yum install -y ./https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
else
  echo "Not Supported OS !!!"
fi
echo "Lauching Google-Chrome"
google-chrome --no-sandbox


