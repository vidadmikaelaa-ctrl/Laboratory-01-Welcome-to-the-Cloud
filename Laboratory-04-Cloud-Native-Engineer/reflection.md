# Reflection

## 1. Why containers start faster than VMs
Containers share the host operating system kernel, so they only start the application — not a whole new OS. VMs have to boot their own kernel, load drivers, and start services, which takes much longer.

## 2. What port mapping does (-p 8080:80)
It connects port 8080 on your computer to port 80 inside the container. Without this, you can't reach the web server from outside. Port 80 is the standard for web, but 8080 is used on your side to avoid conflicts.

## 3. What happens to data when you use `docker rm`
All data stored inside the container is gone forever unless you used a volume. Containers are meant to be temporary — so important files should always be saved separately.

## 4. How containers help teams work together
Developers send the app with everything it needs, and the operations team runs exactly that package. No more "it works on my computer but not yours." Updates and scaling become much easier too.

## 5. How this improves my GitHub portfolio
Now I show real command skills and live deployments, not just writing. Each activity builds on the last, so anyone can see my skills growing step by step.
