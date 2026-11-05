# OPERATIONAL & MAINTENANCE MANUAL
## CloudNova — Enterprise Cloud Architecture
### Laboratory 10 · CCM101 — Cloud Computing

---

## TABLE OF CONTENTS
1. System Overview
2. Deployment Procedure
3. Network Configuration & Access
4. Security — UFW Firewall
5. Daily Maintenance
6. Backup & Disaster Recovery
7. Troubleshooting
8. Appendices

---

## 1. SYSTEM OVERVIEW

### 1.1 Architecture
```

[CLIENT BROWSER] → [PORT 8080] → [WORDPRESS]
                          ↓
                 [DOCKER BRIDGE — ISOLATED]
                          ↓
                    [MYSQL 8.4 — INTERNAL ONLY]
                          ↓
                    [PERSISTENT VOLUME]

```

### 1.2 Component Summary
| Component | Specification |
|---|---|
| Operating System | Ubuntu Server 24.04 LTS |
| Web Service | wordpress:php8.3-apache |
| Database | mysql:8.4 |
| External Port | 8080 — WordPress Public Access |
| Internal Port | 3306 — MySQL, Not Published Externally |
| Storage Volume | cloudnova_db_data — Survives Container Removal |
| Network | cloudnova-network — Isolated Bridge |

### 1.3 Repository Structure
```

Laboratory-10-Enterprise-Cloud-Architect/
├── README.md
├── architecture-diagram.png
├── docker-compose.yml
├── automation-script.sh
├── operational-manual.md
└── final-reflection.md

```

---

## 2. DEPLOYMENT PROCEDURE

### 2.1 Clone Repository
```bash
git clone [https://github.com/YOUR-USERNAME/Laboratory-10-Enterprise-Cloud-Architect.git](https://github.com/YOUR-USERNAME/Laboratory-10-Enterprise-Cloud-Architect.git)
cd Laboratory-10-Enterprise-Cloud-Architect
```

### 2.2 Start Services

```
docker compose up -d
```

### 2.3 Verify Status

```
docker compose ps
```

Expected Result: Both containers show status as Up

### 2.4 Verify Application

```
curl -I [http://localhost:8080](http://localhost:8080)
```

Expected Result: HTTP/1.1 302 Found

### 2.5 Persistence Verification

```
docker compose down
docker volume ls
# Confirm cloudnova_db_data exists
docker compose up -d
```

Expected Result: WordPress loads directly without setup

---

## 3. NETWORK CONFIGURATION & ACCESS

### 3.1 Port Mapping Summary

| Service | Port | Protocol | Access Level |
| --- | --- | --- | --- |
| SSH Administration | 22 | TCP | External — Allowed |
| WordPress Web Application | 8080 | TCP | External — Allowed |
| MySQL Database | 3306 | TCP | Internal Only — Blocked Externally |

### 3.2 Application Access URLs

- Local Server Access:    [http://localhost:8080](http://localhost:8080)
- Network Access:        http://<YOUR-VM-IP-ADDRESS>:8080
- KillerCoda Platform:   Web Preview — Port 8080

### 3.3 Network Design Notes

- Database service is bound to the internal Docker network only.
- Direct database access from outside the host is not permitted.
- All public traffic routes through the WordPress service on port 8080.

---

## 4. SECURITY — UFW FIREWALL

### 4.1 Security Policy

- Default Incoming Traffic: Deny — All ports closed initially.
- Default Outgoing Traffic: Allow — Server may update, sync time, and pull images.
- Least Privilege: Only ports explicitly required for operation are opened.

### 4.2 Firewall Configuration

```
sudo ufw --force reset
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22/tcp comment "SSH Remote Administration"
sudo ufw allow 8080/tcp comment "WordPress Web Application"
sudo ufw enable
```

### 4.3 Verification Procedure

```
sudo ufw status verbose
```

Verification Checklist:

- Status: Active
- Allowed ports: 22, 8080
- Port 3306: Not listed — Database secured externally

### 4.4 Credential Management

Change all default passwords in docker-compose.yml and automation-script.sh before deployment.

```
docker compose up -d --force-recreate
```

---

## 5. DAILY MAINTENANCE

### 5.1 Operational Commands

| Task | Command |
| --- | --- |
| Check service status | `docker compose ps` |
| View all service logs | `docker compose logs` |
| View WordPress logs only | `docker compose logs wordpress` |
| View database logs only | `docker compose logs db` |
| Restart all services | `docker compose restart` |
| Stop all services | `docker compose down` |
| Start all services | `docker compose up -d` |
| View backup operation logs | `cat backups/backup_logs.log` |

### 5.2 Maintenance Guidelines

- Verify service status daily using docker compose ps.
- Review logs periodically for errors or unusual activity.
- After system restart, navigate to project directory and run docker compose up -d.
- Keep container images updated periodically.

---

## 6. BACKUP & DISASTER RECOVERY

### 6.1 Manual Backup Procedure

```
cd ~/Laboratory-10-Enterprise-Cloud-Architect
chmod +x automation-script.sh
./automation-script.sh
ls -lh backups/
```

Result: Timestamped .sql.gz archive created in backups directory.

### 6.2 Scheduled Daily Backup

Backup runs automatically at 02:00 system time each day.

```
(crontab -l 2>/dev/null; echo "0 2 * * * /root/Laboratory-10-Enterprise-Cloud-Architect/automation-script.sh") | crontab -
crontab -l
```

Verification: Schedule entry appears in crontab list.

### 6.3 Restore from Backup

```
cd ~/Laboratory-10-Enterprise-Cloud-Architect/backups
gunzip wordpress_backup_<TIMESTAMP>.sql.gz
docker exec -i cloudnova-db mysql -uroot -pChangeRootPassword123! wordpress < wordpress_backup_<TIMESTAMP>.sql
```

### 6.4 Retention Policy

Backups are retained for 7 days and then automatically removed.
To adjust retention period, modify the RETENTION_DAYS value in automation-script.sh.

---

## 7. TROUBLESHOOTING

| Issue | Resolution |
| --- | --- |
| Container fails to start | Run docker compose logs <service-name> to review errors. Check port conflicts and available disk space. |
| Website unreachable | Run sudo ufw status to confirm port 8080 is allowed. Verify service is running with docker compose ps. |
| Database connection fails | Restart database: docker compose restart db. Wait 10 seconds then restart WordPress. |
| Permission denied on script | Run chmod +x automation-script.sh to make file executable. |
| Insufficient disk space | Run docker system prune to reclaim space. Remove old backup files manually. |
| Services not accessible after reboot | Navigate to project directory and run docker compose up -d. Verify with docker compose ps. |

---

## 8. APPENDICES

### Appendix A — Requirement Compliance

| Requirement | Description | Status |
| --- | --- | --- |
| 1 | Base infrastructure provisioned and verified | Complete |
| 2 | Two-container deployment with persistent storage | Complete |
| 3 | UFW firewall configured with least privilege | Complete |
| 4 | Backup automation and daily schedule configured | Complete |
| 5 | Full documentation and project files submitted | Complete |

### Appendix B — File Reference

| Filename | Purpose |
| --- | --- |
| docker-compose.yml | Service definitions — containers, network, volumes |
| automation-script.sh | Backup, compression, retention, and logging |
| README.md | Project overview and quick-start guide |
| operational-manual.md | Printable handbook version |
| final-reflection.md | Team learning summary and design philosophy |
| architecture-diagram.png | Visual infrastructure topology diagram |

### Appendix C — Important Notes

- All default passwords must be changed before production deployment.
- Database port 3306 is intentionally not exposed to external networks.
- Replace YOUR-USERNAME in clone URL with your actual GitHub account name.
- Backup operation logs are stored at backups/backup_logs.log


### END OF DOCUMENT

CloudNova — Enterprise Cloud Architecture
Laboratory 10 · CCM101 — Cloud Computing
Version 1.0 · November 5, 2026
