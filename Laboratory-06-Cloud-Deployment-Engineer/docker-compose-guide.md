# Docker Compose Guide

## What does the `services:` block do?
The `services:` block defines every container that belongs to your application stack. In this file, two services are declared: `database` using the MariaDB image, and `app` using the Nextcloud image. Compose automatically creates a shared network so these containers can find and talk to each other by their service names.

## How does Nextcloud find the database?
Inside the `app` service, the environment variable `MYSQL_HOST=database` tells Nextcloud to connect to the service named `database` instead of an IP address. Because Docker Compose provides internal DNS resolution between linked services, the name `database` resolves directly to the correct container without needing manual network setup.

## `docker run` vs `docker-compose up -d`
- `docker run` deploys only **one container at a time**. You must manually specify every port, variable, and link each time.
- `docker-compose up -d` reads a complete definition file and spins up **every container, network, and volume** all at once with a single command. Everything is repeatable, shareable, and version-controlled — this is Infrastructure as Code.
