#!/bin/bash

echo "Creating redis from default instance, follow README as user input will be required"

## Copy exisitng redis settings to new redis
cp /etc/redis/redis.conf /etc/redis/redis-6380.conf

## Update variables port, pidfile, logfile and dbfilename
vim /etc/redis/redis-6380.conf

## Confirm ownership
ls -la /etc/redis/redis-6380.conf
chown redis:redis /etc/redis/redis-6380.conf
ls -la /etc/redis/redis-6380.conf

## Copy systemd files
cp /lib/systemd/system/redis-server.service /etc/systemd/system/redis-server-6380.service

## Modify Description, ExecStart, PIDFile and Alias
vim /etc/systemd/system/redis-server-6380.service


## Check status of running redis
systemctl status redis-server.service

## start 2nd redis
systemctl status redis-server-6378.service
systemctl status redis-server-6380.service
systemctl start redis-server-6380.service
systemctl status redis-server-6380.service


## Check redis status
redis-cli -p 6380 ping
redis-cli -p 6379 ping

