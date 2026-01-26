# 🎮 Tic-Tac-Toe: Intelligent Rule-Based AI on AWS

A production-grade web application featuring a heuristic-driven AI engine, deployed on a robust Amazon EC2 environment.

## 🌐 Live Application
The game is currently live and accessible at:  
**[http://3.109.211.113](http://3.109.211.113)** *(Deployed on AWS Free Tier)*

---

## 🧠 AI Engine: Heuristic Decision Logic
The AI utilizes a prioritized heuristic search to evaluate the board state. Rather than random placement, it follows a strict hierarchy of logic:

1.  **Immediate Win**: Scans for any move that completes a line of three for the AI.
2.  **Defensive Block**: Identifies if the player is one move away from winning and blocks that path.
3.  **Strategic Positioning**: Prioritizes taking the center square `board[1][1]` to maximize future winning lines.
4.  **Corner Control**: Randomly selects available corners to create "fork" opportunities.
5.  **Fallback**: Selects any remaining empty cell if no higher-priority moves are available.

---

## 🏗️ Cloud Architecture
This project demonstrates a professional-grade web stack optimized for AWS environments.

| Component | Description |
| :--- | :--- |
| **Reverse Proxy** | **Nginx** handles traffic on Port 80, providing a layer of security and performance. |
| **WSGI Server** | **Gunicorn** manages Flask processes in **Single-Worker Mode** to maintain global memory consistency. |
| **Service Mgmt** | **Systemd** manages the app as a persistent Linux service for high availability. |
| **Hosting** | Deployed on **Amazon Linux 2023** within a secure VPC on **AWS EC2**. |

---

## 🚀 Infrastructure as Code (IaC)
The entire server provisioning and configuration process is automated to ensure the environment is reproducible and scalable.

### Automated Setup
To deploy this project on a fresh instance, execute the included `setup.sh`:

```bash
git clone [https://github.com/AbhayChabuk/TicTacToe-Beatable-AI.git](https://github.com/AbhayChabuk/TicTacToe-Beatable-AI.git)
cd TicTacToe-Beatable-AI
chmod +x setup.sh
./setup.sh
