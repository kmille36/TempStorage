export DISPLAY=:0
export GST_DEBUG=*:2
# Initialize the GStreamer environment after setting GSTREAMER_PATH to the path of your GStreamer directory
export GSTREAMER_PATH=/opt/gstreamer
source "$GSTREAMER_PATH/gst-env"

# Configure the Joystick Interposer
export LD_PRELOAD=/usr/local/lib/selkies-js-interposer/joystick_interposer.so
export SDL_JOYSTICK_DEVICE=/dev/input/js0
sudo mkdir -pm755 /dev/input
sudo touch /dev/input/{js0,js1,js2,js3}

# Start a virtual X11 server, skip this line if an X server already exists or you are already using a display
Xvfb -screen :0 8192x4096x24 +extension RANDR +extension GLX +extension MIT-SHM -nolisten tcp -noreset -shmem 2>&1 >/tmp/Xvfb.log &
# Ensure the X server is ready
until [[ -S /tmp/.X11-unix/X0 ]]; do sleep 1; done && echo 'X Server is ready'
# Initialize PulseAudio (set PULSE_SERVER to unix:/run/pulse/native if your user is in the pulse-access group), omit the below lines if a PulseAudio server is already running
export PULSE_SERVER=tcp:127.0.0.1:4713
sudo /usr/bin/pulseaudio -k >/dev/null 2>&1
sudo /usr/bin/pulseaudio --daemonize --system --verbose --log-target=file:/tmp/pulseaudio.log --realtime=true --disallow-exit -L 'module-native-protocol-tcp auth-ip-acl=127.0.0.0/8 port=4713 auth-anonymous=1'
# Replace this line with your desktop environment session or skip this line if already running, use VirtualGL `vglrun` here if needed
[[ "${START_XFCE4:-true}" == "true" ]] && rm -rf ~/.config/xfce4 && xfce4-session &
# Replace to your resolution if using without resize, skip if there is a physical display
selkies-gstreamer-resize 1280x720

# Choose your video encoder, change to x264enc for software encoding or other encoders for different hardware
# Do not set enable_resize to true if there is a physical display
# Starts the remote desktop process
selkies-gstreamer --addr=0.0.0.0 --port=8081 --enable_https=false --https_cert=/etc/ssl/certs/ssl-cert-snakeoil.pem --https_key=/etc/ssl/private/ssl-cert-snakeoil.key --basic_auth_user=user --basic_auth_password=password --encoder=vp8enc --enable_resize=false &
