#!/bin/bash
yum update -y && yum install docker -y
systemctl start docker
sleep 5
docker run -d -p 3001:80 asadrao123/caddy:v1
# end of script