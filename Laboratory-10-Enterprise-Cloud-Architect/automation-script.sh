#!/bin/bash
set -euo pipefail
umask 077

cd /home/mika/CloudNova
mkdir -p backups

STAMP=$(date +%Y%m%d-%H%M%S)
BACKUP="backups/mysql-$STAMP.sql.gz"
TEMP_SQL="/tmp/cloudnova-backup.sql"
TEMP_LOCAL="backups/mysql-$STAMP.sql"

trap 'rm -f "$TEMP_LOCAL"' EXIT

docker compose exec -T db sh -c 'MYSQL_PWD="$MYSQL_ROOT_PASSWORD" mysqldump -u root --no-tablespaces --single-transaction --databases "$MYSQL_DATABASE" > /tmp/cloudnova-backup.sql'

docker cp cloudnova-db-1:"$TEMP_SQL" "$TEMP_LOCAL"

gzip "$TEMP_LOCAL"
chmod 600 "$BACKUP"
gzip -t "$BACKUP"

docker compose exec -T db rm -f "$TEMP_SQL"

find backups -type f -name 'mysql-*.sql.gz' -mtime +7 -delete

echo "Backup completed: $BACKUP"
