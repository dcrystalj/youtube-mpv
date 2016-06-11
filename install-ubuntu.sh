#! /bin/sh

PYTHON="/usr/bin/python3"
YMPV_DIR="/opt/youtube-mpv"

#install dependencies
pip3 install youtube_dl

#install server
sudo mkdir $YMPV_DIR
sudo cp ytdl_server.py $YMPV_DIR
sudo cp ytdl_config.py $YMPV_DIR

#install DAEMON
sudo touch /etc/systemd/system/youtube-mpv.service
sudo cat > "/etc/systemd/system/youtube-mpv.service" <<EOF
[Unit]
Description=Python server which can play youtube links

[Service]
Type=simple
ExecStart=${PYTHON} "${YMPV_DIR}/ytdl_server.py"

[Install]
WantedBy=default.target
EOF


sudo systemctl daemon-reload
sudo systemctl restart youtube-mpv
sudo systemctl enable youtube-mpv
