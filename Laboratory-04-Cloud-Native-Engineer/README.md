# Laboratory Activity 4 — The Cloud-Native Engineer

## Mission Overview
After completing earlier cloud projects, I explored cloud-native engineering and containers. This activity covered the differences between Virtual Machines and Containers, then used Docker in the KillerCoda Playground to deploy, verify, and manage an Nginx web server.

## Objectives
- Differentiate Virtual Machines from Containers
- Check Docker installation and status
- Pull, run, verify, stop, and remove a container
- Document all steps in Markdown
- Maintain a complete GitHub portfolio

## Docker Commands Executed
```bash
docker --version
docker info
docker pull nginx
docker run -d -p 8080:80 nginx
curl http://localhost:8080
docker ps
docker stop 99de8fbc3d9c
docker ps -a
docker rm 99de8fbc3d9c



```
Skills Learned
- Docker version 29.1.3 is running on Ubuntu 24.04.4 LTS
- Containers start in seconds and use far fewer resources than VMs
- Port mapping -p 8080:80 connects the host to the container's web server
- curl confirms a web server is responding
- Containers can be stopped and then removed completely

Challenges Encountered
- Remembering to use the actual Container ID from docker ps instead of placeholders
- Understanding that docker ps shows only running containers, while docker ps -a shows all
- Verifying that the HTML output from curl means the server is working correctly
