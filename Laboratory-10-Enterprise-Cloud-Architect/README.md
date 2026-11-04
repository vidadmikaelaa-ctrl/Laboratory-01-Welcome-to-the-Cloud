# Mission 10 — Enterprise Cloud Architect
**Project:** CloudNova — WordPress + MySQL Multi-Tier Stack

## Stack Overview
- **Frontend:** WordPress (PHP 8.3 / Apache)
- **Backend:** MySQL 8.4 Database
- **Platform:** Docker + Docker Compose
- **Networking:** Isolated Docker bridge network
- **Persistence:** Named volume for database data
- **Security:** UFW — Default Deny, minimum ports exposed
- **Automation:** Daily backups at 02:00 AM via Cron

## Quick Start
```bash
# Clone repository
git clone https://github.com/YOUR-USERNAME/CCM101-jcosstales.git
cd CCM101-jcosstales/Laboratory-10-Enterprise-Cloud-Architect

# Launch the stack
docker-compose up -d

# Check status
docker-compose ps
