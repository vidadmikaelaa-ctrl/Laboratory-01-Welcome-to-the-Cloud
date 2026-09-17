# Docker Deployment Steps

| Command | What It Does |
|---|---|
| `docker --version` | Shows which version of Docker is installed |
| `docker info` | Shows system details about Docker |
| `docker pull nginx` | Downloads the Nginx web server image |
| `docker run -d -p 8080:80 nginx` | Starts Nginx in background; connects port 8080 to port 80 |
| `curl http://localhost:8080` | Checks if the web server is running |
| `docker ps` | Shows all containers that are currently running |
| `docker stop [container-id]` | Turns off the running container |
| `docker ps -a` | Shows every container — running or stopped |
| `docker rm [container-id]` | Deletes the stopped container permanently |
