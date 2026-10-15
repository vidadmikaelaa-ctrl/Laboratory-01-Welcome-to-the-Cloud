# CloudNova Enterprise

CloudNova Enterprise is a cloud infrastructure laboratory project using Ubuntu Server, Docker, WordPress, and MySQL.

## Technologies
- Ubuntu Server 26.04 LTS
- Oracle VirtualBox
- Docker Engine and Docker Compose
- WordPress with PHP 8.3 and Apache
- MySQL 8.4
- OpenSSH
- UFW Firewall
- Cron Backup Automation

## Features
- Containerized WordPress website
- MySQL database with persistent storage
- Remote SSH administration
- Firewall configuration
- Automated daily database backups
- Database restoration testing
- WordPress files backup

## Architecture Diagram
![CloudNova Architecture](documentation/architecture-diagram.png)

## Documentation
- [Architecture Overview](documentation/architecture.md)
- [Operational Manual](documentation/operational-manual.md)
- [Architecture Diagram Source](documentation/architecture-diagram.md)

## Security
Database credentials are stored in a private .env file.
Sensitive files and database backups are excluded from Git.

## Backup Schedule
MySQL database backups are scheduled daily at 2:00 AM server time.

## Project Purpose
This project demonstrates basic cloud infrastructure deployment, container management, backup automation, and system administration.
