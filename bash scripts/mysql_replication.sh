#!/bin/bash

MASTER_IP="master-db-ip"
SLAVE_IP="slave-db-ip"
MYSQL_ROOT_PASSWORD="yourpassword"

# On Master
mysql -u root -p$MYSQL_ROOT_PASSWORD -e "GRANT REPLICATION SLAVE ON *.* TO 'replicator'@'%' IDENTIFIED BY 'replica_password'; FLUSH PRIVILEGES;"

# On Slave
mysql -u root -p$MYSQL_ROOT_PASSWORD -e "CHANGE MASTER TO MASTER_HOST='$MASTER_IP', MASTER_USER='replicator', MASTER_PASSWORD='replica_password', MASTER_LOG_FILE='mysql-bin.000001', MASTER_LOG_POS=  4; START SLAVE;"
