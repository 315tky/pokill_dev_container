#!/bin/bash
#mysql -u username -p dbname <  <sde sql file>

curl --output mysql_sde_import_md5sum https://www.fuzzwork.co.uk/dump/mysql-latest.tar.bz2.md5 
# check_cksum if not matching previous, then 

curl --output mysql_sde_import https://www.fuzzwork.co.uk/dump/mysql-latest.tar.bz2
bunzip2 mysql-latest.tar
tar -xvf sde
#import to mysql using mysql container
docker exec -i pokill_dev_container_mysql_db_1 sh -c 'exec mysql -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" $MYSQL_DATABASE' < sde-*/sde*
