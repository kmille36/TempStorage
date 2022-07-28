
 
 
 sleep 1
 CF=$(curl -s --connect-timeout 5 --max-time 5 localhost:8080 | grep -Eo "(http|https)://[a-zA-Z0-9./?=_%:-]*" | sort -u | sed s/'http[s]\?:\/\/'//)
 echo -n $CF > CF
 if [ -s CF ]; then echo OK; else echo -en "\r Checking Guacamole .     $i 🌐 ";sleep 0.1;echo -en "\r Checking Guacamole ..    $i 🌐 ";sleep 0.1;echo -en "\r Checking Guacamole ...   $i 🌐 ";sleep 0.1;echo -en "\r Checking Guacamole ....  $i 🌐 ";sleep 0.1;echo -en "\r Checking Guacamole ..... $i 🌐 ";sleep 0.1;echo -en "\r Checking Guacamole     . $i 🌐 ";sleep 0.1;echo -en "\r Checking Guacamole  .... $i 🌐 ";sleep 0.1;echo -en "\r Checking Guacamole   ... $i 🌐 ";sleep 0.1;echo -en "\r Checking Guacamole    .. $i 🌐 ";sleep 0.1;echo -en "\r Checking Guacamole     . $i 🌐 ";sleep 0.1 && bash final-script.sh; fi
 
 echo "Guacamole Running !!!"
