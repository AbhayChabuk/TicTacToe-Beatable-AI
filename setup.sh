#!/bin/bash
# =================================================================
# Tic-Tac-Toe Automated Deployment Script (IaC)
# Target OS: Amazon Linux 2023
# Author: Engineering Student / AWS Solutions Architect Aspirant
# =================================================================

set -e # Exit immediately if a command fails

# 1. DEFINE VARIABLES
PROJECT_NAME="TicTacToe-Beatable-AI"
REPO_URL="https://github.com/AbhayChabuk/TicTacToe-Beatable-AI.git"
INSTALL_DIR="/home/ec2-user/$PROJECT_NAME"

echo "Step 1: Updating System & Installing Stack..."
sudo dnf update -y
sudo dnf install python3-pip python3-devel nginx git -y

echo "Step 2: Cloning Repository & Setting up Venv..."
if [ -d "$INSTALL_DIR" ]; then sudo rm -rf "$INSTALL_DIR"; fi
git clone "$REPO_URL" "$INSTALL_DIR"
cd "$INSTALL_DIR"
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt gunicorn

echo "Step 3: Creating Systemd Service for Gunicorn..."
# This automates the background process with 1 worker for state consistency
sudo bash -c "cat > /etc/systemd/system/tictactoe.service <<EOF
[Unit]
Description=Gunicorn instance for TicTacToe (Single Worker Mode)
After=network.target

[Service]
User=ec2-user
Group=nginx
WorkingDirectory=$INSTALL_DIR
Environment=\"PATH=$INSTALL_DIR/venv/bin\"
ExecStart=$INSTALL_DIR/venv/bin/gunicorn --workers 1 --bind 127.0.0.1:8000 application:application

[Install]
WantedBy=multi-user.target
EOF"

echo "Step 4: Configuring Nginx Reverse Proxy..."
# This routes Port 80 traffic to Gunicorn on Port 8000
sudo bash -c "cat > /etc/nginx/conf.d/tictactoe.conf <<EOF
server {
    listen 80;
    server_name _;

    location / {
        proxy_pass http://127.0.0.1:8000;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
    }
}
EOF"

echo "Step 5: Starting Services..."
sudo systemctl daemon-reload
sudo systemctl enable --now tictactoe
sudo systemctl restart nginx

echo "================================================================="
echo "DEPLOYMENT SUCCESSFUL!"
echo "Your Tic-Tac-Toe AI is live at: http://$(curl -s http://checkip.amazonaws.com)"
echo "================================================================="
