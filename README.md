# 🎮 Tic-Tac-Toe: Unbeatable AI on AWS

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?logo=amazon-aws&logoColor=white)](https://aws.amazon.com/)
[![Flask](https://img.shields.io/badge/flask-%23000.svg?logo=flask&logoColor=white)](https://flask.palletsprojects.com/)

An engineering-grade deployment of the classic Tic-Tac-Toe game, featuring an **Unbeatable AI** powered by the **Minimax Algorithm**. This project demonstrates a full-stack production lifecycle, from local development to a cloud-native deployment on **Amazon EC2**.

---

## 🏗️ Deployment Architecture

To ensure high availability and security, the application is deployed using a reverse-proxy architecture.



* **Nginx**: Acts as the entry point (Reverse Proxy), handling incoming HTTP traffic on Port 80 and forwarding it to the application server.
* **Gunicorn**: A WSGI HTTP Server that runs the Flask application. It is configured in **Single-Worker Mode** to ensure game state consistency across user moves.
* **Systemd**: Manages the Gunicorn process as a background service, ensuring it automatically restarts if the server reboots.
* **Amazon EC2**: Hosted on an **Amazon Linux 2023** t2.micro instance within the AWS Free Tier.

---

## 🧠 The "Brain": Minimax Algorithm

The AI doesn't just play randomly; it thinks. I implemented the **Minimax Algorithm**, a recursive decision-making tool that explores all possible game outcomes.

* **Recursive Depth-First Search**: The AI simulates every move until a win, loss, or draw is reached.
* **Optimal Strategy**: It chooses moves that maximize its own score while minimizing the player's potential to win.
* **Outcome**: The AI is mathematically unbeatable. The best result a human player can achieve is a draw.

---

## 🛠️ Tech Stack

* **Backend**: Python 3.9+, Flask
* **Frontend**: Vanilla JavaScript (ES6+), CSS3, HTML5
* **Web Server**: Nginx
* **WSGI Server**: Gunicorn
* **Infrastructure**: AWS (EC2, Security Groups, VPC)

---

## 🚀 Infrastructure as Code (IaC)

I have automated the entire server setup to ensure one-click deployments. The `setup.sh` script handles:
1.  System updates and dependency installation (`dnf`, `pip`).
2.  Virtual environment provisioning.
3.  Automated generation of **Systemd** service units.
4.  Automated **Nginx** configuration and reverse-proxy mapping.

### How to Deploy
```bash
git clone [https://github.com/YOUR_USERNAME/TicTacToe-Beatable-AI.git](https://github.com/YOUR_USERNAME/TicTacToe-Beatable-AI.git)
cd TicTacToe-Beatable-AI
chmod +x setup.sh
./setup.sh
