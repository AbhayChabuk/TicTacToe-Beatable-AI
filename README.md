# 🎮 Tic-Tac-Toe: Intelligent Rule-Based AI on AWS

A production-grade web application featuring a heuristic-driven AI engine, deployed on a robust Amazon EC2 environment.

## 🌐 Live Application
The game is currently live and accessible at:  
**[http://15.206.3.137](http://15.206.3.137)** *(Deployed on AWS Free Tier)*

---

## 🏗️ Cloud Architecture & Deployment
This project demonstrates a professional-grade web stack optimized for AWS environments, ensuring high availability and state management.

| Component | Technology | Purpose |
| :--- | :--- | :--- |
| **Cloud Provider** | **AWS EC2** | Hosted on Amazon Linux 2023 within a secure VPC. |
| **Reverse Proxy** | **Nginx** | Handles traffic on Port 80 and provides a security buffer. |
| **WSGI Server** | **Gunicorn** | Configured in **Single-Worker Mode** to ensure board state consistency. |
| **Service Mgmt** | **Systemd** | Manages the app as a background service for 24/7 uptime. |

---

## 🧠 AI Engine: Heuristic Decision Logic
Instead of a simple random choice, the AI prioritizes moves based on the following heuristic hierarchy:

1. **Immediate Win:** Completes its own line of three.
2. **Defensive Block:** Stops the player from completing a line.
3. **Strategic Positioning:** Prioritizes the center square `[1][1]`.
4. **Corner Control:** Claims corners to set up "fork" traps.
5. **Fallback:** Occupies the remaining empty cells.

---

## 🚀 Infrastructure as Code (IaC)
To deploy this project on a fresh Amazon Linux instance, run the automated setup script:

```bash
git clone [https://github.com/AbhayChabuk/TicTacToe-Beatable-AI.git](https://github.com/AbhayChabuk/TicTacToe-Beatable-AI.git)
cd TicTacToe-Beatable-AI
chmod +x setup.sh
./setup.sh
