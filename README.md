# FastAPI DevOps Project

<p align="center">
  <img src="https://img.shields.io/badge/Python-3.12-blue" alt="Python">
  <img src="https://img.shields.io/badge/FastAPI-API-green" alt="FastAPI">
  <img src="https://img.shields.io/badge/Docker-Containerization-blue" alt="Docker">
  <img src="https://img.shields.io/badge/Docker_Compose-Orchestration-blue" alt="Docker Compose">
  <img src="https://img.shields.io/badge/Kubernetes-Deployment-blue" alt="Kubernetes">
  <img src="https://img.shields.io/badge/Ansible-Automation-red" alt="Ansible">
  <img src="https://img.shields.io/badge/GitHub_Actions-CI/CD-black" alt="GitHub Actions">
</p>

---

## Overview

FastAPI DevOps Project is a portfolio project that demonstrates how to containerize, test, deploy and operate a Python web application using modern DevOps tools and practices.

The project includes:

* FastAPI application
* Dockerfile
* Docker Compose
* Healthcheck endpoint
* Makefile automation
* GitHub Actions CI
* Ansible deployment
* Kubernetes manifests
* ConfigMap and Secret
* Liveness and readiness probes
* Resource requests and limits

---

## Architecture

```text
Developer
    |
    v
Git Push
    |
    v
GitHub Actions CI
    |
    v
Docker Build and Test
    |
    v
Docker Compose / Kubernetes
    |
    v
FastAPI Application
```

---

## Kubernetes Architecture

```text
Kubernetes Cluster
        |
        v
Namespace: fastapi-devops
        |
        v
Deployment
        |
        v
FastAPI Pods
        |
        v
Service NodePort
        |
        v
Client Requests
```

---

## Technologies

* Python
* FastAPI
* Uvicorn
* Docker
* Docker Compose
* Kubernetes
* GitHub Actions
* Ansible
* Makefile
* Linux
* Git

---

## Project Structure

```text
fastapi-devops-project/
│
├── app/
│   └── main.py
│
├── ansible/
│   ├── inventory
│   └── playbooks/
│       └── deploy.yml
│
├── k8s/
│   ├── namespace.yaml
│   ├── deployment.yaml
│   ├── service.yaml
│   ├── configmap.yaml
│   └── secret.yaml
│
├── .github/
│   └── workflows/
│       └── ci.yml
│
├── Dockerfile
├── docker-compose.yaml
├── requirements.txt
├── Makefile
├── .gitignore
└── README.md
```

---

## API Endpoints

### Root Endpoint

```text
GET /
```

Example response:

```json
{
  "status": "ok",
  "service": "devops-project"
}
```

### Health Endpoint

```text
GET /health
```

Example response:

```json
{
  "health": "healthy"
}
```

---

## Requirements

* Docker
* Docker Compose
* Git
* Ansible
* Kubernetes cluster or k3s
* kubectl

---

## Quick Start

Clone repository:

```bash
git clone git@github.com:YOUR_USERNAME/fastapi-devops-project.git
cd fastapi-devops-project
```

Build and start application:

```bash
make build
make up
```

Check health:

```bash
make health
```

---

## Run with Docker Compose

```bash
docker compose up -d
```

or:

```bash
make up
```

---

## Stop Application

```bash
docker compose down
```

or:

```bash
make down
```

---

## Build Image

```bash
docker compose build
```

or:

```bash
make build
```

---

## Health Check

```bash
curl http://localhost:8000/health
```

or:

```bash
make health
```

Expected response:

```json
{
  "health": "healthy"
}
```

---

## Validate Docker Compose

```bash
docker compose config
```

or:

```bash
make check
```

---

## Makefile Commands

| Command | Description |
|--------|-------------|
| `make up` | Start application |
| `make down` | Stop application |
| `make build` | Build Docker image |
| `make restart` | Restart application |
| `make ps` | Show running containers |
| `make logs` | Show container logs |
| `make health` | Check health endpoint |
| `make check` | Validate Docker Compose config |

---

## Dockerfile

The project uses a lightweight Python image:

```dockerfile
FROM python:3.12-slim

WORKDIR /app

RUN apt-get update && apt-get install -y curl

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY app app

EXPOSE 8000

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
```

---

## Docker Compose

Docker Compose is used to build and run the FastAPI application:

```yaml
services:
  fastapi:
    build: .
    ports:
      - "8000:8000"
    restart: unless-stopped
    healthcheck:
      test: ["CMD", "curl", "-f", "http://localhost:8000/health"]
      interval: 30s
      timeout: 10s
      retries: 3
```

---

## Deploy with Ansible

Run deployment:

```bash
sudo ansible-playbook -i ansible/inventory ansible/playbooks/deploy.yml
```

The Ansible playbook performs:

1. Creates application directory
2. Copies project files
3. Starts Docker Compose stack

---

## Kubernetes

The project also includes Kubernetes manifests for deploying the FastAPI application.

### Kubernetes Resources

```text
k8s/
├── namespace.yaml
├── deployment.yaml
├── service.yaml
├── configmap.yaml
└── secret.yaml
```

### Resource Description

| Resource | Purpose |
|---------|---------|
| Namespace | Isolates project resources |
| Deployment | Manages FastAPI Pods |
| Service | Exposes the application |
| ConfigMap | Stores application configuration |
| Secret | Stores sensitive data |
| Liveness Probe | Restarts unhealthy containers |
| Readiness Probe | Sends traffic only to ready Pods |
| Resource Requests | Defines minimum CPU and memory |
| Resource Limits | Defines maximum CPU and memory |

---

## Deploy to Kubernetes

Create namespace:

```bash
kubectl apply -f k8s/namespace.yaml
```

Deploy all resources:

```bash
kubectl apply -f k8s/
```

---

## Verify Kubernetes Deployment

Check Pods:

```bash
kubectl get pods -n fastapi-devops
```

Check Deployment:

```bash
kubectl get deployments -n fastapi-devops
```

Check Services:

```bash
kubectl get services -n fastapi-devops
```

Check all resources:

```bash
kubectl get all -n fastapi-devops
```

---

## Test Kubernetes Application

Root endpoint:

```bash
curl http://localhost:30081
```

Health endpoint:

```bash
curl http://localhost:30081/health
```

Expected response:

```json
{
  "health": "healthy"
}
```

---

## Kubernetes Features

This project demonstrates:

* Namespace isolation
* Deployment with multiple replicas
* NodePort Service
* ConfigMap
* Secret
* Liveness Probe
* Readiness Probe
* Resource Requests
* Resource Limits
* Rolling Updates
* Self-Healing Pods

---

## CI/CD

GitHub Actions pipeline performs:

1. Checkout repository
2. Validate Makefile
3. Validate Docker Compose
4. Build Docker containers
5. Start containers
6. Test root endpoint
7. Test health endpoint
8. Show running containers

---

## GitHub Actions Workflow

```yaml
name: FastAPI CI

on:
  push:
    branches:
      - main

jobs:
  build-and-test:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Check Makefile exists
        run: test -f Makefile

      - name: Validate Docker Compose
        run: docker compose config

      - name: Build containers
        run: docker compose build

      - name: Start containers
        run: docker compose up -d

      - name: Wait for app
        run: sleep 10

      - name: Test root endpoint
        run: curl -f http://localhost:8000

      - name: Test health endpoint
        run: curl -f http://localhost:8000/health

      - name: Show containers
        run: docker ps
```

---

## Security

Do not store secrets in this repository.

Sensitive data such as:

* Passwords
* Tokens
* API keys
* SSH private keys
* Cloud credentials

should be stored using:

* Environment variables
* GitHub Actions Secrets
* Kubernetes Secrets
* Secret management tools

The `k8s/secret.yaml` file contains only example values and must not contain real production secrets.

---

## Troubleshooting

### Docker container name conflict

If a container with the same name already exists:

```bash
docker ps -a
docker rm -f CONTAINER_NAME
```

### Docker permission denied

If Docker cannot stop or remove containers:

```bash
sudo systemctl restart docker
sudo systemctl restart containerd
```

If the issue persists, reboot the VM:

```bash
sudo reboot
```

### FastAPI container logs

```bash
docker logs CONTAINER_NAME
```

### Kubernetes Pod logs

```bash
kubectl logs POD_NAME -n fastapi-devops
```

### Describe Kubernetes Pod

```bash
kubectl describe pod POD_NAME -n fastapi-devops
```

---

## Future Improvements

* Add Ingress
* Add TLS certificate
* Add Helm chart
* Add Kubernetes HPA
* Add Docker image publishing to Docker Hub or GitHub Container Registry
* Add automated deployment from GitHub Actions
* Add monitoring with Prometheus and Grafana
* Add logging with Loki or ELK
* Add Terraform infrastructure provisioning
* Add production-ready secrets management

---

## Roadmap

### Completed

* FastAPI application
* Dockerfile
* Docker Compose
* Healthcheck endpoint
* Makefile automation
* GitHub Actions CI
* Ansible deployment
* Kubernetes Deployment
* Kubernetes Service
* ConfigMap
* Secret
* Probes
* Resource limits

### Planned

* Ingress
* Helm
* Container registry
* Automated deployment
* Monitoring
* Logging
* Cloud deployment

---

## Skills Demonstrated

This project demonstrates:

* Python application containerization
* Dockerfile creation
* Docker Compose usage
* Healthcheck configuration
* CI/CD pipeline creation
* Infrastructure automation with Ansible
* Kubernetes application deployment
* Kubernetes configuration management
* Resource management
* DevOps portfolio project structure
* Basic production deployment workflow

---

## Screenshots

Add screenshots here:

```text
docs/screenshots/
├── github-actions-success.png
├── docker-ps.png
├── fastapi-health.png
└── kubernetes-pods.png
```

Recommended screenshots:

* Successful GitHub Actions pipeline
* Docker container running with healthy status
* FastAPI `/health` response
* Kubernetes Pods running
* Kubernetes Service output

---

## License

This project is created for educational and portfolio purposes.

---

## Author

Haoki Takeda

DevOps Engineer Portfolio Project
