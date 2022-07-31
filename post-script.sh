    apt install zip -y 
    curl -k -L -O https://github.com/kmille36/TempStorage/raw/main/guacamole.zip 
    curl -k -L -O https://github.com/kmille36/TempStorage/raw/main/guacamole.z01 
    zip -F guacamole.zip --out file-large.zip 
    unzip file-large.zip  
    docker run --network host -d -v /root/guacamole:/config jwetzell/guacamole
    sudo fallocate -l 1G /swapfile ; sudo chmod 600 /swapfile ; sudo mkswap /swapfile ; sudo swapon /swapfile
