# Reflection

## 1. Boot Time & Setup
Docker containers start in seconds because they share the host OS kernel and only load the application. A Virtual Machine boots a full separate operating system — kernel, drivers, services — which takes minutes. VMs are like building a whole new house; containers are just moving in the furniture.

## 2. Port Mapping (-p 8080:80)
Port mapping connects port 8080 on my host machine to port 80 inside the container. Without it, the container is isolated and unreachable. Port 80 is the standard HTTP port inside containers, but 8080 is used on the host to avoid conflicts with anything else running there.

## 3. Data After `docker rm`
All data stored directly inside the container is permanently lost when removed. Containers are designed to be temporary and disposable. Important data must be saved separately using volumes so it persists even when containers are deleted.

## 4. Impact on DevOps
Containerization removes the "it works on my machine" problem. Developers package the app with everything it needs, and operations teams run that exact same package. This speeds up releases, simplifies scaling, and makes updates much safer — bringing development and operations teams much closer together.

## 5. GitHub Portfolio Growth
My portfolio now shows real, hands-on technical work — not just writing. Each lab builds on the last, creating a clear timeline of skills. It's consistently organized so anyone reviewing it can easily follow my progress and see my abilities growing step by step.
