#!/bin/sh

. ../.env

sudo docker cp ../dump/osadnici.sql oracle-cloud:/
sudo docker exec -i oracle-cloud bash -c "sqlplus ${ORACLE_USER}/${ORACLE_PWD}@//localhost:1521/minigame as sysdba @/osadnici.sql"

