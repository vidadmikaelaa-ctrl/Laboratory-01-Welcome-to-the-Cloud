# Laboratory 04 — Cloud Native Engineer

## Mission Overview
This laboratory demonstrates how to deploy a cloud-native application stack using Docker Compose. We set up Nextcloud as the frontend application with MariaDB as the backend database, running as separate, connected containers — illustrating microservices architecture, container orchestration, and multi-service deployment.

## Objectives
- Write and use a `docker-compose.yml` file to define multi-container services
- Deploy Nextcloud and MariaDB containers that communicate with each other
- Map container ports to the host for web access
- Manage the full lifecycle: start → verify → access → stop → clean up
- Document the process with screenshots and technical notes

## Commands Executed
```bash
mkdir -p nextcloud-deployment
cd nextcloud-deployment
nano docker-compose.yml
docker-compose up -d
docker-compose ps
docker-compose down

```
### Skills Learned
* Docker Compose simplifies managing multi-container applications with a single configuration file
* Services can communicate with each other using their service names as hostnames (database from app)
* Port mapping -p 8080:80 makes the container's web server accessible from the host browser
* Environment variables configure database credentials and connection details without editing application code
* docker-compose up -d starts everything in the background; docker-compose down cleanly removes all resources
* Maintaining correct YAML indentation — improper spacing causes parsing errors; each level must be consistently indented
* Distinguishing between YAML syntax errors and actual deployment issues
* Understanding that the database takes a few extra seconds to initialize — the web app may need a moment to fully connect
* Ensuring all credential values match exactly across both services so the Nextcloud app can authenticate to MariaDB
