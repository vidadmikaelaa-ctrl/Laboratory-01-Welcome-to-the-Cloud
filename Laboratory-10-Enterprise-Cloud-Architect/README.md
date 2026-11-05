# CloudNova — Enterprise Cloud Architecture
## Laboratory 10 · CCM101 — Cloud Computing
Operational & Maintenance Handbook for WordPress + MySQL multi-tier cloud infrastructure.

# Laboratory 10 — Enterprise Cloud Architect
CloudNova Multi-Tier WordPress Stack
CCM101 — Cloud Computing

## Repository Contents
- `README.md`
- `architecture-diagram.png`
- `docker-compose.yml`
- `automation-script.sh`
- `operational-manual.md`
- `final-reflection.md`

## Access
- Web: `http://<VM-IP>:8080`
- KillerCoda: Web Preview → Port 8080


## Quick Deploy
git clone https://github.com/vidadmikaelaa-ctrl/Laboratory-10-Enterprise-Cloud-Architect.git
cd Laboratory-10-Enterprise-Cloud-Architect
docker compose up -d
docker compose ps

## Access URLs

- Local: `http://localhost:8080`
- Network: `http://<YOUR-VM-IP-ADDRESS>:8080`
- Database: Internal only — not exposed externally

## Repository Structure
Laboratory-10-Enterprise-Cloud-Architect/
├── README.md
├── architecture-diagram.png
├── docker-compose.yml
├── automation-script.sh
├── operational-manual.md
└── final-reflection.md


## Requirement Status


| Requirement | Description | Status |
| --- | --- | --- |
| 1 | Base infrastructure provisioned & verified | Complete |
| 2 | 2-container deployment with persistent storage | Complete |
| 3 | UFW firewall configured with least privilege |  Complete |
| 4 | Backup automation & daily schedule configured |  Complete |
| 5 | Full documentation & project files submitted |  Complete |

## Key Commands


| Task | Command |
| --- | --- |
| Check service status | `docker compose ps` |
| View logs | `docker compose logs` |
| Restart stack | `docker compose restart` |
| Stop services | `docker compose down` |
| Start services | `docker compose up -d` |
| Firewall status | `sudo ufw status verbose` |
| Run backup manually | `./automation-script.sh` |
| View backup logs | `cat backups/backup_logs.log` |
| Check scheduled tasks | `crontab -l` |
