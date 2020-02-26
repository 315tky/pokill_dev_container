#!/bin/bash

md5_file="mysql-latest.tar.bz2.md5"
mysql_file="mysql-latest.tar.bz2"
md5_url="https://www.fuzzwork.co.uk/dump/mysql-latest.tar.bz2.md5"
mysql_url="https://www.fuzzwork.co.uk/dump/mysql-latest.tar.bz2"

if [ -f $md5_file ];then
  rm $md5_file
fi

# get latest md5_file
echo "downloading latest md5sum for check"
curl --output ./$md5_file $md5_url

if [ ! -f $mysql_file ];then 
  echo "no mysql tar file found, downloading new"
  curl --output ./$mysql_file $mysql_url
  latest_md5_checksum=`cat $md5_file`
  mysql_file_checksum=`/usr/bin/md5sum $mysql_file`
  if [ "$latest_md5_checksum" = "$mysql_file_checksum" ];then  
     echo "checksums of newly downloaded tar file matches latest md5sum" 
     tar xvfj $mysql_file 
     exit
  else
     echo "something wrong, latest md5sum and mysql_tar file from fuzzwork remote server do not match"
     exit
  fi
else
  latest_md5_checksum=`cat $md5_file`
  mysql_file_checksum=`/usr/bin/md5sum $mysql_file`
  if [ "$latest_md5_checksum" = "$mysql_file_checksum" ];then
    echo "latest md5sum file matches previous mysql tar file, nothing to do"
    exit
  else
    curl --output ./$mysql_file $mysql_url
    mysql_file_checksum=`/usr/bin/md5sum $mysql_file`
    if [ "$latest_md5_checksum" = "$mysql_file_checksum" ];then
      tar xvfj $mysql_file
      exit
    else 
      echo "something wrong, latest md5sum and mysql_tar file from fuzzwork remote server do no match"
      exit
    fi
  fi
fi
