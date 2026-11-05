### =====================================================================
                OPERATIONAL & MAINTENANCE HANDBOOK
           CloudNova — Enterprise Cloud Architecture
               Laboratory 10 — CCM101 — Cloud Computing
=====================================================================

DOCUMENT INFORMATION
  Project:        CloudNova Multi-Tier WordPress Stack
  Institution:    University of Eastern Pangasinan
  Course:         CCM101 — Cloud Computing
  Lab:            Laboratory 10 — Enterprise Cloud Architect
  Version:        1.0
  Date:           November 5, 2026
  Audience:       Client IT Administration Team
  Purpose:        Deploy, Secure, Maintain, Backup, Recover

=====================================================================
                         TABLE OF CONTENTS
=====================================================================

1. SYSTEM OVERVIEW
   1.1  Architecture Description
   1.2  Component Summary
   1.3  Repository Structure

2. DEPLOYMENT PROCEDURE
   2.1  Prerequisites
   2.2  Clone Repository
   2.3  Start Services
   2.4  Verify Deployment
   2.5  Persistence Verification

3. NETWORK CONFIGURATION & ACCESS
   3.1  Port Mapping Summary
   3.2  Application Access
   3.3  Internal vs External Traffic

4. SECURITY HARDENING — UFW FIREWALL
   4.1  Policy Framework
   4.2  Step-by-Step Configuration
   4.3  Verification Checklist
   4.4  Credential Management

5. DAILY MAINTENANCE
   5.1  Status Monitoring
   5.2  Service Control Commands
   5.3  Log Inspection

6. BACKUP & DISASTER RECOVERY
   6.1  Manual Backup Procedure
   6.2  Automated Daily Backup (Cron)
   6.3  Restore from Backup
   6.4  Retention Policy

7. TROUBLESHOOTING
   7.1  Common Issues & Resolution
   7.2  Recovery Checklist

8. APPENDICES
   Appendix A — docker-compose.yml Reference
   Appendix B — automation-script.sh Reference
   Appendix C — Requirement Compliance Summary

=====================================================================
1. SYSTEM OVERVIEW
=====================================================================

1.1 Architecture Description
----------------------------
This project implements a multi-tier cloud infrastructure consisting of:
- Web Frontend:  WordPress (PHP 8.3 / Apache) — Public-facing
- Database Backend: MySQL 8.4 — Internal only, never exposed publicly
- Network:  Isolated Docker bridge network — secure inter-container communication
- Storage:  Persistent Docker volume — data survives container removal and restart

1.2 Component Summary
----------------------
| Component        | Specification                  | Purpose
|------------------|--------------------------------|-------------------------
| Operating System | Ubuntu Server 24.04 LTS        | Base platform
| Web Service      | wordpress:php8.3-apache        | Frontend application
| Database         | mysql:8.4                      | Data persistence
| Web Port         | 8080 → mapped from 80         | Public HTTP access
| DB Port          | 3306 — internal only          | Restricted to Docker
| Volume           | cloudnova_db_data              | Persistent storage
| Network          | cloudnova-network              | Isolated service layer

1.3 Repository Structure
------------------------
Laboratory-10-Enterprise-Cloud-Architect/
├── README.md
├── architecture-diagram.png
├── docker-compose.yml
├── automation-script.sh
├── operational-manual.md
└── final-reflection.md

=====================================================================
2. DEPLOYMENT PROCEDURE
=====================================================================

2.1 Prerequisites
-----------------
- Ubuntu Server 24.04 LTS installed and fully updated
- Docker Engine and Docker Compose installed
- Internet connectivity to pull container images

2.2 Clone Repository
--------------------
git clone https://github.com/YOUR-USERNAME/Laboratory-10-Enterprise-Cloud-Architect.git
cd Laboratory-10-Enterprise-Cloud-Architect

2.3 Start Services
------------------
docker-compose up -d

2.4 Verify Deployment
---------------------
docker-compose ps

Expected Output:
  Name                  State    Ports
  cloudnova-db          Up       3306/tcp
  cloudnova-wordpress   Up       0.0.0.0:8080->80/tcp

Application Health Check:
  curl -I http://localhost:8080
  Expected: HTTP/1.1 302 Found 

2.5 Persistence Verification
-----------------------------
docker-compose down
docker volume ls
  → Confirm cloudnova_db_data exists 
docker-compose up -d
  → WordPress loads directly — no reinstall required 

=====================================================================
3. NETWORK CONFIGURATION & ACCESS
=====================================================================

3.1 Port Mapping Summary
-------------------------
| Service        | Port   | Protocol | Access      | Status
|----------------|--------|----------|-------------|-------------------
| SSH Admin      | 22     | TCP      | External    | Allowed 
| WordPress Web  | 8080   | TCP      | External    | Allowed 
| MySQL DB       | 3306   | TCP      | Internal    | Blocked — secured 

3.2 Application Access
-----------------------
- Local Server:     http://localhost:8080
- Network Access:   http://<YOUR-VM-IP>:8080
- KillerCoda:       Web Preview → Port 8080

3.3 Internal vs External Traffic
----------------------------------
- WordPress → MySQL traffic routes through Docker bridge network
- Database port 3306 is never published to host interface
- All database connections originate from within the stack only

=====================================================================
4. SECURITY HARDENING — UFW FIREWALL
=====================================================================

4.1 Policy Framework
---------------------
- Default Incoming:   DENY  → Close everything first
- Default Outgoing:   ALLOW → Server can update, pull images, sync time
- Least Privilege:    Open only ports explicitly required for operation

4.2 Step-by-Step Configuration
-------------------------------
# Reset firewall to clean state
sudo ufw --force reset

# Apply default deny policy
sudo ufw default deny incoming
sudo ufw default allow outgoing

# Allow administration access
sudo ufw allow 22/tcp comment "SSH — Remote Administration"

# Allow public application access
sudo ufw allow 8080/tcp comment "WordPress — Web Application"

# Activate firewall
sudo ufw enable

4.3 Verification Checklist
---------------------------
sudo ufw status verbose

Expected Result:
  Status: active
  Default: deny (incoming), allow (outgoing)
  22/tcp  ALLOW IN  Anywhere  # SSH — Remote Administration
  8080/tcp ALLOW IN Anywhere  # WordPress — Web Application

 Port 3306 (MySQL) — NOT LISTED → Secured 

4.4 Credential Management
-------------------------
Update passwords in BOTH files before production deployment:
  - docker-compose.yml → MYSQL_PASSWORD, WORDPRESS_DB_PASSWORD
  - automation-script.sh → DB_ROOT_PASS

Apply changes:
  docker-compose up -d --force-recreate

=====================================================================
5. DAILY MAINTENANCE
=====================================================================

5.1 Status Monitoring
----------------------
docker-compose ps          → Check running state
docker-compose logs        → View all service logs
docker-compose logs db      → Database logs only
docker-compose logs wordpress → Web service logs only

5.2 Service Control Commands
-----------------------------
docker-compose restart      → Restart entire stack
docker-compose down         → Stop and remove containers
docker-compose up -d        → Start stack in background

5.3 Log Inspection
-------------------
# Real-time log monitoring
docker-compose logs -f

# Check backup logs
cat ~/Laboratory-10-Enterprise-Cloud-Architect/backups/backup_logs.log

=====================================================================
6. BACKUP & DISASTER RECOVERY
=====================================================================

6.1 Manual Backup Procedure
-----------------------------
cd ~/Laboratory-10-Enterprise-Cloud-Architect

chmod +x automation-script.sh
./automation-script.sh

ls -lh backups/
  → Timestamped .sql.gz file created

6.2 Automated Daily Backup (Cron)
----------------------------------
# Schedule backup at 02:00 AM daily
(crontab -l 2>/dev/null; echo "0 2 * * * /root/Laboratory-10-Enterprise-Cloud-Architect/automation-script.sh") | crontab -

# Confirm schedule
crontab -l
  → 0 2 * * * /root/Laboratory-10-Enterprise-Cloud-Architect/automation-script.sh

6.3 Restore from Backup
------------------------
cd ~/Laboratory-10-Enterprise-Cloud-Architect/backups

# Decompress backup
gunzip wordpress_backup_YYYYMMDD_HHMMSS.sql.gz

# Import into database
docker exec -i cloudnova-db mysql -uroot -pChangeRootPassword123! wordpress < wordpress_backup_YYYYMMDD_HHMMSS.sql

6.4 Retention Policy
---------------------
- Backups retained for 7 days automatically
- Older files deleted on each backup run
- Modify RETENTION_DAYS in automation-script.sh to adjust

=====================================================================
7. TROUBLESHOOTING
=====================================================================

| Issue                          | Resolution
|--------------------------------|-----------------------------------
| Container not starting         | docker-compose logs <service> → check error messages
| Website unreachable            | sudo ufw status → confirm port 8080 allowed
| Database connection failed     | docker-compose restart db → wait 10s → restart wordpress
| Backup script permission denied| chmod +x automation-script.sh
| Disk space low                  | docker system prune → delete old backups manually
| Stack unreachable after reboot | cd ~/Laboratory-10-Enterprise-Cloud-Architect → docker-compose up -d

=====================================================================
8. APPENDICES
=====================================================================

Appendix A — docker-compose.yml Summary
---------------------------------------
- Defines 2 services: db (MySQL 8.4), wordpress (PHP 8.3/Apache)
- Creates isolated bridge network: cloudnova-network
- Creates persistent volume: db_data
- Restart policy: always → auto-recover after reboot

Appendix B — automation-script.sh Summary
-------------------------------------------
- Exports WordPress database via mysqldump
- Compresses output with gzip
- Logs success/failure timestamp
- Purges files older than RETENTION_DAYS (default: 7)

Appendix C — Requirement Compliance Summary
---------------------------------------------
| Requirement | Status
|-------------|-------
| 1 — Base Infrastructure | Provisioned, reachable, verified
| 2 — Deployment & IaC   | 2 containers, persistent volume, survives restart
| 3 — Security Hardening | UFW active, Default Deny, only 2 ports open
| 4 — Backup Automation  | Script tested, daily Cron scheduled at 02:00 AM
| 5 — Documentation      | This handbook + code + reflection in repo

=====================================================================
                         END OF DOCUMENT
=====================================================================
