# CloudNova Enterprise
## Operational Manual

### 1. Server Information
Operating System: Ubuntu Server 26.04 LTS
Virtualization: Oracle VirtualBox
Application: WordPress
Database: MySQL 8.4
Container Platform: Docker Compose

### 2. Connect to Ubuntu Server
From Windows PowerShell:

ssh -p 2222 mika@127.0.0.1

### 3. Open Project Directory
cd ~/CloudNova

### 4. Start Docker Containers
sudo docker compose up -d

### 5. Check Container Status
sudo docker compose ps

### 6. Access WordPress
Open the browser:

http://127.0.0.1:8080

### 7. Check Firewall
sudo ufw status

### 8. Run Database Backup
sudo /usr/bin/flock -n /run/lock/cloudnova-backup.lock /home/mika/CloudNova/backup.sh

### 9. Check Database Backups
ls -lh ~/CloudNova/backups/

### 10. Verify Compressed Backup
sudo gzip -t ~/CloudNova/backups/mysql-YYYYMMDD-HHMMSS.sql.gz

Replace YYYYMMDD-HHMMSS with the actual backup timestamp.

### 11. Automatic Backup
The database backup is scheduled daily at
2:00 AM server time using Cron.

Check schedule:
sudo crontab -l

### 12. Stop Docker Containers
sudo docker compose down

Do not use the -v option because it removes
Docker-managed volumes containing persistent data.

### 13. Restart Docker Containers
sudo docker compose restart

### 14. Troubleshooting
Check Docker status:
sudo systemctl status docker --no-pager

Check WordPress logs:
sudo docker compose logs --tail=50 wordpress

Check MySQL logs:
sudo docker compose logs --tail=50 db

### 15. Security
SSH access is enabled.
UFW firewall is configured.
Database credentials are stored in .env.
Backup files have restricted permissions.
