#!/bin/bash
if [ -s "$PGDATA" ]; then
echo "*:*:*:$PG_REP_USER:$PG_REP_PASSWORD" > ~/.pgpass
chmod 0600 ~/.pgpass
pg_basebackup -h postgresql-master -D ${PGDATA} -U ${PG_REP_USER} -W
echo "host replication all 0.0.0.0/0 md5" >> "$PGDATA/pg_hba.conf"
set -e
cat > ${PGDATA}/recovery.conf <<EOF
recovery_target_timeline = 'latest'
standby_mode = on
primary_conninfo = 'host=postgresql-master port=5432 user=repl password=mypassword'
EOF
cat >> ${PGDATA}/postgresql.conf <<EOF
wal_level = hot_standby   
max_connections = 300   
hot_standby = on 
max_standby_streaming_delay = 30s 
wal_receiver_status_interval = 10s  
hot_standby_feedback = on 
EOF
chown postgres. ${PGDATA} -R
chmod 700 ${PGDATA} -R
fi
#sed -i 's/wal_level = hot_standby/wal_level = replica/g' ${PGDATA}/postgresql.conf
exec "$@"
