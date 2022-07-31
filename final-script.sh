
 
 
 sleep 1
 CF=$(curl -s --connect-timeout 5 --max-time 5 localhost:8080 | grep -Eo "templates.js")
 echo -n $CF > CF
 if [ -s CF ]; then echo OK; else echo -en "\r Checking Guacamole .     $i 🌐 ";sleep 0.1;echo -en "\r Checking Guacamole ..    $i 🌐 ";sleep 0.1;echo -en "\r Checking Guacamole ...   $i 🌐 ";sleep 0.1;echo -en "\r Checking Guacamole ....  $i 🌐 ";sleep 0.1;echo -en "\r Checking Guacamole ..... $i 🌐 ";sleep 0.1;echo -en "\r Checking Guacamole     . $i 🌐 ";sleep 0.1;echo -en "\r Checking Guacamole  .... $i 🌐 ";sleep 0.1;echo -en "\r Checking Guacamole   ... $i 🌐 ";sleep 0.1;echo -en "\r Checking Guacamole    .. $i 🌐 ";sleep 0.1;echo -en "\r Checking Guacamole     . $i 🌐 ";sleep 0.1 && bash final-script.sh; fi
 
 echo "Guacamole Running !!!"
 
 rm -rf final-script.sh
 rm -rf file-large.zip
 rm -rf CF
 rm -rf guacamole.z01
 rm -rf guacamole.zip
 
 echo "Creating 1GB SWAP file..."
 ssh -t root@node01 "sudo fallocate -l 1G /swapfile ; sudo chmod 600 /swapfile ; sudo mkswap /swapfile ; sudo swapon /swapfile"
 echo "SWAP file created !!!"
sleep 999999
