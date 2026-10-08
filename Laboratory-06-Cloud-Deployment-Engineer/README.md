# Laboratory Activity 6 — The Cloud Deployment Engineer

## Mission Overview
Building on previous cloud projects, I moved from deploying single containers to managing multi-container applications using Docker Compose. This mission deployed a full Nextcloud private cloud stack — a web application paired with a MariaDB database — defined entirely through code in a YAML file. This demonstrates Infrastructure as Code (IaC) and modern multi-tier architecture practices.

## Objectives
- Explain multi-tier application architecture
- Understand and write a docker-compose.yml configuration
- Use nano text editor to create files in Linux
- Deploy Nextcloud + MariaDB stack with Docker Compose
- Document everything in Markdown
- Grow professional GitHub portfolio

## Commands Executed
```bash
mkdir nextcloud-deployment
cd nextcloud-deployment
nano docker-compose.yml
docker-compose up -d
docker-compose ps
docker-compose down

```
### Skills Learned
- Docker Compose defines and manages multiple containers in one file
- YAML uses strict indentation — spaces only, no tabs
- Services on the same Compose network can communicate using service names
- Environment variables securely pass configuration without hardcoding
- docker-compose up -d = start everything in background
- docker-compose down = stop and remove the entire stack cleanly
