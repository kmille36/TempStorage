@echo off
curl -LkO https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-windows-amd64.zip
tar xf ngrok-stable-windows-amd64.zip
cls
set /p id="Paste NGROK AUTHTOKEN: "
echo "======================="
echo "choose ngrok region (for better connection)."
echo "======================="
echo "us - United States (Ohio)"
echo "eu - Europe (Frankfurt)"
echo "ap - Asia/Pacific (Singapore)"
echo "au - Australia (Sydney)"
echo "sa - South America (Sao Paulo)"
echo "jp - Japan (Tokyo)"
echo "in - India (Mumbai)"
set /p re="Choose ngrok region: "
ngrok authtoken %id%
ngrok tcp --region %re% 3389
