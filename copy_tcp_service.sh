sudo cp tcp_server.service /lib/systemd/system/tcp_server.service

sudo chmod 644 /lib/systemd/system/tcp_server.service

sudo systemctl daemon-reload

sudo systemctl enable tcp_server.service

sudo systemctl status tcp_server.service
