#!/bin/bash
#cp /home/stgsh/postgrest/* /var/lib/postgresql/data/
mkdir -p $PGDATA/main/archive/
chown -R postgres:postgres $PGDATA
echo "host replication all 0.0.0.0/0 md5" >> "$PGDATA/pg_hba.conf"
echo "host all all 0.0.0.0/0 md5" >> "$PGDATA/pg_hba.conf"
set -e
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
CREATE USER $PG_REP_USER REPLICATION LOGIN CONNECTION LIMIT 100 ENCRYPTED PASSWORD '$PG_REP_PASSWORD';
EOSQL

sed -i 's#UTC#Asia/Taipei#g' ${PGDATA}/postgresql.conf
cat >> ${PGDATA}/postgresql.conf <<EOF
wal_level = hot_standby
archive_mode = on
archive_command = 'cp -i %p $PGDATA/main/archive/%f'
max_wal_senders = 3
wal_keep_segments = 100
EOF
