# 🎮 Tic-Tac-Toe AI — Evolution from Traditional Deployment to Containerized Cloud Architecture

An end-to-end project demonstrating the transformation of a web application from a traditional single-server deployment to a containerized, production-style cloud architecture on AWS.

---

## 🌐 Live Deployment

### 🟢 Current Deployment (Dockerized — Active)

**Docker-based deployment on AWS EC2 (Cost-Optimized)**
http://15.206.3.137

The application is currently running inside a Docker container on a single EC2 instance to remain within AWS Free Tier limits.

---

## 🧠 Project Evolution

### 🥇 Initial Deployment — Traditional Server Setup

Originally, the application was deployed directly on AWS EC2 without containerization using:

* Nginx reverse proxy
* Gunicorn WSGI server
* Systemd service for process management
* Linux server configuration

This represented a **classic production deployment approach** before adopting containerization.

---

### 🥈 Containerization Upgrade (Major Enhancement)

The application was later Dockerized to achieve:

* Environment consistency
* Portability across systems
* Simplified deployment process
* Production parity between local and cloud environments

Gunicorn was configured in single-worker mode to preserve game state consistency.

---

### 🥉 Scalable Cloud Architecture Implementation

To simulate a production-grade system, the containerized application was deployed behind AWS infrastructure services:

* Application Load Balancer for traffic distribution
* Auto Scaling Group for automatic scaling
* Multi-instance deployment
* Self-healing capability via health checks

This architecture ensured high availability and fault tolerance.

---

### 💸 Cost Optimization Decision

Since Load Balancers and multiple EC2 instances incur charges outside the free tier:

* Load Balancer and Auto Scaling Group were disabled after testing
* Deployment reverted to single-instance Docker setup

This demonstrates practical awareness of cloud cost management.

---

# 🏗️ Architecture Comparison

## Before (Traditional Deployment)

Users → Nginx → Gunicorn → Flask App (Single EC2)

---

## After (Containerized Deployment)

Users → EC2 → Docker Container → Flask App

---

## Production Architecture (Tested)

Users → Application Load Balancer → Auto Scaling Group → EC2 Instances → Docker Containers → Flask App

---

# 🚀 Features Implemented

## 🐳 Containerization

* Dockerized Flask application
* Production server using Gunicorn
* Debugged multi-worker state issues

## ☁️ Cloud Deployment

* AWS EC2 hosting
* Security group configuration
* Public internet accessibility

## ⚖️ Scalability & Reliability (Tested)

* Load balancing
* Auto scaling
* Multi-AZ deployment concepts
* Self-healing infrastructure

## 🔍 Production Troubleshooting

Resolved real deployment issues including:

* Gunicorn concurrency problems
* Load balancer health check failures
* Security group communication
* Container lifecycle management

---

# 🧠 AI Engine

Heuristic-based AI prioritizing:

1. Winning move
2. Blocking opponent
3. Center control
4. Corner strategy
5. Remaining cells

---

# 🛠️ Tech Stack

### Application

* Python
* Flask
* HTML/CSS/JavaScript

### DevOps & Cloud

* AWS EC2
* Docker
* Application Load Balancer
* Auto Scaling Group
* Gunicorn
* Nginx
* Linux (Ubuntu)
* Git & GitHub

---

# 🎯 Key Learning Outcomes

* Traditional vs containerized deployment approaches
* End-to-end cloud deployment
* High availability architecture design
* Infrastructure debugging
* Cost-aware cloud engineering

---

# 👨‍💻 Author

**Abhay — Computer Engineering Student**

Aspiring DevOps & Cloud Engineer 🚀
