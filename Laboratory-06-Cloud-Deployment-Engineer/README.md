# Laboratory 06 — Cloud Deployment Engineer

## Mission Overview
Building on previous cloud projects, I transitioned from deploying single containers to managing multi-container applications using Docker Compose. This mission deployed a full Nextcloud private cloud stack — a web application paired with a MariaDB database — defined entirely through code in a YAML configuration file. This demonstrates Infrastructure as Code (IaC) and modern multi-tier architecture practices.

## Objectives
- Explain multi-tier application architecture
- Understand and write a `docker-compose.yml` configuration file
- Use the nano text editor to create files in Linux
- Deploy a Nextcloud plus MariaDB stack using Docker Compose
- Document procedures and IaC principles in Markdown
- Maintain a professional GitHub cloud computing portfolio

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
* Docker Compose simplifies managing multi-container applications with a single configuration file
* Services can communicate with each other using their service names as hostnames (database from app)
* Port mapping -p 8080:80 makes the container's web server accessible from the host browser
* Environment variables configure database credentials and connection details without editing application code
* docker-compose up -d starts everything in the background; docker-compose down cleanly removes all resources
* Maintaining correct YAML indentation — improper spacing causes parsing errors; each level must be consistently indented
* Distinguishing between YAML syntax errors and actual deployment issues
* Understanding that the database takes a few extra seconds to initialize — the web app may need a moment to fully connect
* Ensuring all credential values match exactly across both services so the Nextcloud app can authenticate to MariaDB
