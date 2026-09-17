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
