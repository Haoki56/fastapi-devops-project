# FastAPI DevOps Project

## Overview

FastAPI DevOps Project is a portfolio project that demonstrates how to containerize, test and deploy a Python web application using DevOps tools and practices.

The project includes:

* FastAPI application
* Dockerfile
* Docker Compose
* Healthcheck endpoint
* Makefile automation
* GitHub Actions CI
* Ansible deployment

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
Docker Compose
    |
    v
FastAPI Application
```

---

## Technologies

* Python
* FastAPI
* Uvicorn
* Docker
* Docker Compose
* GitHub Actions
* Ansible
* Makefile
* Linux

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

---

## Run with Docker Compose

```bash
make up
```

or:

```bash
docker compose up -d
```

---

## Stop Application

```bash
make down
```

---

## Build Image

```bash
make build
```

---

## Health Check

```bash
make health
```

---

## Validate Docker Compose

```bash
make check
```

---

## Deploy with Ansible

```bash
sudo ansible-playbook -i ansible/inventory ansible/playbooks/deploy.yml
```

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

## Security

Do not store secrets in this repository.

Sensitive data such as passwords, tokens, API keys and SSH keys should be stored using environment variables or secret management tools.

---

## Skills Demonstrated

This project demonstrates:

* Python application containerization
* Dockerfile creation
* Docker Compose usage
* Healthcheck configuration
* CI/CD pipeline creation
* Infrastructure automation with Ansible
* Basic deployment workflow
* DevOps portfolio project structure

---

## Author

Haoki Takeda

DevOps Engineer Portfolio Project
