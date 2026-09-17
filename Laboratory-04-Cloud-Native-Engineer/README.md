# Laboratory Activity 4 — The Cloud-Native Engineer

## Mission Overview
After successfully completing earlier cloud projects, I am now exploring cloud-native engineering. This activity focuses on understanding containers and how they differ from traditional Virtual Machines (VMs). Using Docker in the KillerCoda Playground, I will deploy, manage, and document a containerized Nginx web server.

## Objectives
- Differentiate Virtual Machines from Containers
- Access a Docker-enabled environment via KillerCoda
- Execute core Docker CLI commands
- Deploy and manage an Nginx container
- Document technical work using Markdown
- Maintain a structured GitHub portfolio

## Docker Commands Executed
```bash
docker --version
docker info
docker pull nginx
docker run -d -p 8080:80 nginx
curl http://localhost:8080
docker ps
docker stop [container-id]
docker ps -a
docker rm [container-id]
