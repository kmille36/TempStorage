function goto
{
    label=$1
    cmd=$(sed -n "/^:[[:blank:]][[:blank:]]*${label}/{:a;n;p;ba};" $0 | 
          grep -v ':$')
    eval "$cmd"
    exit
}

 
 
 : begin
 CF=$(curl -s --connect-timeout 5 --max-time 5 localhost:8080 | grep -Eo "(http|https)://[a-zA-Z0-9./?=_%:-]*" | sort -u | sed s/'http[s]\?:\/\/'//)
 echo -n $CF > CF
 if [ -s CF2 ]; then echo OK; else echo -en "\r Checking .     $i 🌐 ";sleep 0.1;echo -en "\r Checking ..    $i 🌐 ";sleep 0.1;echo -en "\r Checking ...   $i 🌐 ";sleep 0.1;echo -en "\r Checking ....  $i 🌐 ";sleep 0.1;echo -en "\r Checking ..... $i 🌐 ";sleep 0.1;echo -en "\r Checking     . $i 🌐 ";sleep 0.1;echo -en "\r Checking  .... $i 🌐 ";sleep 0.1;echo -en "\r Checking   ... $i 🌐 ";sleep 0.1;echo -en "\r Checking    .. $i 🌐 ";sleep 0.1;echo -en "\r Checking     . $i 🌐 ";sleep 0.1 && goto begin; fi
 
 echo "Guacamole Running !!!"
