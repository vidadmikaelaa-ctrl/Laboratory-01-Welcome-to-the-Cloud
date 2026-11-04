# Operational Manual
Handover Guide for Client IT Team

## 1. Deployment
```bash
cd ~/Laboratory-10-Enterprise-Cloud-Architect
docker-compose up -d
docker-compose ps
```
## 2. Security — UFW Firewall
sudo ufw --force reset
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22/tcp comment "SSH Remote Admin"
sudo ufw allow 8080/tcp comment "WordPress Web App"
sudo ufw enable
sudo ufw status verbose

## 3. Maintenance
docker-compose ps          # Check status
docker-compose logs        # View logs
docker-compose restart     # Restart stack
docker-compose down        # Stop containers
docker-compose up -d       # Start containers

## 4. Backup — Manual & Scheduled
chmod +x automation-script.sh
./automation-script.sh
ls -lh backups/

`Daily backup at 2:00 AM`
(crontab -l 2>/dev/null; echo "0 2 * * * /root/Laboratory-10-Enterprise-Cloud-Architect/automation-script.sh")
crontab -l

## 5. Restore from Backup
gunzip backups/<BACKUP-FILE-NAME>.sql.gz
docker exec -i cloudnova-db mysql -uroot -pChangeRootPassword123! wordpress < backups/<BACKUP-FILE-NAME>.sql

## 6. Persistence Verification
docker-compose down
docker volume ls
docker-compose up -d
