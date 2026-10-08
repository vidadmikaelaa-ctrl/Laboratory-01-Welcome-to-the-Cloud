# Docker Compose Configuration Guide

## Purpose of the `services:` Block
The `services:` block defines every container that makes up the application stack. In this deployment, two services are declared: `database` based on the MariaDB image for data storage, and `app` based on the Nextcloud image for the user interface. Docker Compose automatically creates a private shared network so these services can discover and communicate with one another without manual network setup.

## How Nextcloud Finds the Database
Nextcloud locates the database through the environment variable `MYSQL_HOST=database`. Within the Compose network, the service name `database` automatically resolves to the correct container's internal address. This built-in DNS resolution means there is no need to find or hardcode IP addresses — referencing the service name directly is sufficient.

## `docker run` Compared to `docker-compose up -d`
The `docker run` command deploys only one container at a time and requires all flags, ports, and links to be typed manually each time. In contrast, `docker-compose up -d` reads a complete definition file and spins up every container, network, and volume all at once with a single command. The Compose approach is fully repeatable, version-controlled, and consistent across every environment — this is the foundation of Infrastructure as Code.
