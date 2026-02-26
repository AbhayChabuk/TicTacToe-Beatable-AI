# 🎮 Tic-Tac-Toe AI | Scalable Containerized Cloud Deployment

A production-style cloud project demonstrating the end-to-end journey of building, containerizing, scaling, and automating the deployment of an intelligent web application on AWS using modern DevOps practices.

This project combines **application development, heuristic AI decision-making, cloud architecture, scalability engineering, and CI/CD automation** into a single real-world deployment scenario.

---

## 🧠 Project Overview

The project began as a locally developed Flask web application implementing an intelligent Tic-Tac-Toe opponent. It was progressively transformed into a cloud-native system capable of scalable deployment and automated delivery, simulating real production environments.

**Key goals:**

- Build an intelligent rule-based AI opponent  
- Deploy the application using containerization  
- Design scalable cloud infrastructure  
- Implement automated deployment pipeline  
- Demonstrate cost-aware cloud resource management  

---

## 🧩 Application Development

### Web Application

- Backend built using **Python (Flask)**
- RESTful endpoints for gameplay interactions
- Dynamic frontend using HTML, CSS, and JavaScript
- Interactive browser-based UI

---

## 🧠 AI Engine — Heuristic Decision Logic

The AI opponent uses a prioritized rule-based strategy instead of random moves, enabling competitive gameplay without complex machine learning models.

### Decision Hierarchy

1. **Immediate Win Detection** — Completes its own line of three if possible  
2. **Defensive Blocking** — Prevents the player from winning  
3. **Strategic Center Control** — Prioritizes occupying the center square  
4. **Corner Dominance** — Attempts to control corners to create fork opportunities  
5. **Fallback Move Selection** — Chooses remaining available positions  

This heuristic approach demonstrates algorithmic decision-making and game strategy implementation.

---

## 🐳 Containerization

The application was containerized using Docker to ensure:

- Consistent runtime environment  
- Portability across systems  
- Simplified deployment  

**Key components:**

- Production-ready Dockerfile  
- Gunicorn WSGI server inside container  
- Optimized dependency installation  
- Exposed application port  

---

## ☁️ Cloud Deployment (AWS)

The containerized application was deployed on AWS infrastructure.

### Core Deployment Features

- Hosting on AWS EC2  
- Secure network configuration via security groups  
- Public internet accessibility  
- Production-style server configuration  

---

## ⚖️ Scalability & High Availability

To simulate real-world infrastructure, the deployment was extended to support scalability:

- Application Load Balancer for traffic distribution  
- Target Groups with health checks  
- Auto Scaling Group for automatic instance management  
- Multi-instance deployment across availability zones  
- Self-healing through automatic instance replacement  

This architecture ensures service continuity during failures or traffic spikes.

---

## 🔁 CI/CD Automation

A fully automated deployment pipeline was implemented using GitHub Actions.

### Automated Workflow

On every code push:

1. Build Docker image  
2. Push image to Docker Hub  
3. Secure SSH deployment to EC2  
4. Pull latest container image  
5. Replace running container  
6. Application updates automatically  

This eliminates manual deployment steps and enables continuous delivery.

---

## 💸 Cost Optimization

After validating scalability and automation features, cloud resources were responsibly decommissioned to prevent unnecessary charges, demonstrating practical cost management in cloud environments.

---

## 🧠 DevOps Practices Demonstrated

- Containerized deployments  
- Infrastructure scalability design  
- Automated CI/CD pipeline  
- Production debugging & troubleshooting  
- Secure secrets management  
- Resource lifecycle management  
- Cost-aware cloud usage  

---

## 🛠️ Technology Stack

### Cloud & DevOps

- AWS EC2  
- Application Load Balancer  
- Auto Scaling Group  
- GitHub Actions  
- Docker & Docker Hub  

### Backend

- Python (Flask)  
- Gunicorn  

### Frontend

- HTML  
- CSS  
- JavaScript  

---

## 📊 Deployment Evolution

**Phase 1 — Local Development**  
Flask application with heuristic AI logic.

**Phase 2 — Containerization**  
Docker-based deployment.

**Phase 3 — Scalable Infrastructure**  
Load balancing and auto scaling.

**Phase 4 — CI/CD Automation**  
Automated build and deployment pipeline.

---

## 📈 Key Learnings

- Designing scalable cloud systems  
- Implementing containerized architectures  
- Automating deployment workflows  
- Troubleshooting production issues  
- Balancing performance and cost  

---

## 🚀 Future Enhancements

- Monitoring & logging integration  
- HTTPS and domain configuration  
- Advanced security hardening  
- Private subnet architecture  
- Zero-downtime deployment strategies  

---

## 👨‍💻 Author

**Abhay Chabuk**  
Final-Year Computer Engineering Student  
Aspiring Cloud & DevOps Engineer

