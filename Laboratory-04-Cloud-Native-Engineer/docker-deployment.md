# Docker Deployment & Lifecycle

| Command | What It Does |
|---|---|
| `docker --version` | Confirms Docker is installed — version 29.1.3 |
| `docker info` | Shows system details: Ubuntu 24.04.4 LTS, 1 CPU, storage driver overlay2 |
| `docker pull nginx` | Downloads the official Nginx web server image from Docker Hub |
| `docker run -d -p 8080:80 nginx` | Starts Nginx in detached mode; maps host port 8080 → container port 80 |
| `curl http://localhost:8080` | Sends request — returns HTML = server is running ✅ |
| `docker ps` | Lists running containers — showed ID `99de8fbc3d9c` |
| `docker stop 99de8fbc3d9c` | Gracefully stops the running container |
| `docker ps -a` | Shows all containers — status changed to **Exited (0)** |
| `docker rm 99de8fbc3d9c` | Permanently deletes the stopped container |
