SET TOKEN=1YhyjW3lK2BEBeNul7lcR3QoS6C_22K9WY61ZdVnc2A27TSZf
SET PASS=Thuonghai001
SET USER=Hai

curl --silent -O https://raw.githubusercontent.com/TheDarkMythos/Ngrok-Exe/master/ngrok.exe
copy ngrok.exe C:\Windows\System32 >nul
ngrok authtoken %TOKEN%
start ngrok tcp --region ap 3389
tzutil /s "SE Asia Standard Time" >nul
sc start audiosrv >nul
net config server /srvcomment:"HaiNguyen" > out.txt 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /V EnableAutoTray /T REG_DWORD /D 0 /F > out.txt 2>&1
net user administrator %PASS% /add >nul
net localgroup administrators administrator /add >nul
net user %USER% %PASS% /add >nul
net localgroup administrators %USER% /add >nul
net user VssAdministrator %PASS% >nul
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
netsh advfirewall firewall set rule group="remote desktop" new enable=Yes
curl -o "C:\Users\Public\Desktop\Fast Config VPS.exe" https://raw.githubusercontent.com/DangDev/dangdev/main/software/FastConfigVPS_v2.3.exe > out.txt 2>&1
curl -o "C:\Users\Public\Desktop\EVKey Vietnamese Keyboard.exe" https://raw.githubusercontent.com/DangDev/dangdev/main/software/EVKey64.exe > out.txt 2>&1
curl -o "C:\Users\Public\Desktop\Enable Session notification.vbs" https://raw.githubusercontent.com/DangDev/dangdev/main/Session.vbs > out.txt 2>&1
diskperf -Y >nul
sc config Audiosrv start= auto >nul
ICACLS C:\Windows\Temp /grant administrator:F >nul
ICACLS C:\Windows\installer /grant VssAdministrator:F >nul
ICACLS C:\Windows\Temp /grant VssAdministrator:F >nul
ICACLS C:\Windows\installer /grant administrator:F >nul
echo Completed!
tasklist | find /i "ngrok.exe" >Nul && curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url || echo "Can't get NGROK tunnel. Maybe your previous VM still running: https://dashboard.ngrok.com/status/tunnels "
echo https://dashboard.ngrok.com/cloud-edge/status
net stop was /y
@echo off
:loop
ping -n 99999999999999999999999999999999 10.10.10.10 >nul
goto loop
