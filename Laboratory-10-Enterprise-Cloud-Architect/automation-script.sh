#!/bin/bash
BACKUP_DIR="/root/Laboratory-10-Enterprise-Cloud-Architect/backups"
DB_CONTAINER="cloudnova-db"
DB_NAME="wordpress"
DB_ROOT_PASS="ChangeRootPassword123!"
RETENTION_DAYS=7
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="${BACKUP_DIR}/wordpress_backup_${TIMESTAMP}.sql"
LOG_FILE="${BACKUP_DIR}/backup_logs.log"

mkdir -p "${BACKUP_DIR}"
echo "=== Backup started at $(date) ===" >> "${LOG_FILE}"

docker exec "${DB_CONTAINER}" \
  mysqldump -uroot -p"${DB_ROOT_PASS}" \
    --single-transaction --quick --lock-tables=false --no-tablespaces \
    "${DB_NAME}" > "${BACKUP_FILE}"

if [ $? -eq 0 ]; then
  gzip "${BACKUP_FILE}"
  echo "SUCCESS: ${BACKUP_FILE}.gz" >> "${LOG_FILE}"
else
  echo "FAILED at $(date)" >> "${LOG_FILE}"
  exit 1
fi

find "${BACKUP_DIR}" -name "*.sql.gz" -mtime +${RETENTION_DAYS} -delete
echo "=== Done at $(date) ===" >> "${LOG_FILE}"
exit 0
