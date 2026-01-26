#!/bin/bash

# 1. Update and Install Dependencies
sudo dnf update -y
sudo dnf install python3-pip git nginx -y

# 2. Clone the Repository
cd /home/ec2-user
git clone https://github.com/AbhayChabuk/TicTacToe-Beatable-AI.git
cd TicTacToe-Beatable-AI

# 3. Setup Virtual Environment and Install Requirements
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
pip install gunicorn

# 4. Create Gunicorn Systemd Service
# This prevents the "203/EXEC" error by using absolute paths
sudo bash -c 'cat > /etc/systemd/system/tictactoe.service <<EOF
[Unit]
Description=Gunicorn instance to serve TicTacToe AI
After=network.target

[Service]
User=ec2-user
Group=nginx
WorkingDirectory=/home/ec2-user/TicTacToe-Beatable-AI
Environment="PATH=/home/ec2-user/TicTacToe-Beatable-AI/venv/bin"
ExecStart=/home/ec2-user/TicTacToe-Beatable-AI/venv/bin/gunicorn --bind 0.0.0.0:5000 app:app

[Install]
WantedBy=multi-user.target
EOF'

# 5. Configure Nginx as Reverse Proxy
sudo bash -c 'cat > /etc/nginx/conf.d/tictactoe.conf <<EOF
server {
    listen 80;
    server_name _;

    location / {
        proxy_pass http://127.0.0.1:5000;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
    }
}
EOF'

# 6. Start and Enable Services
sudo systemctl start tictactoe
sudo systemctl enable tictactoe
sudo systemctl restart nginx
sudo systemctl enable nginx

echo "Deployment Complete! Check your EC2 Public IP."
