#!/bin/sh
#------------------------------------------------
# 刷新 HTTPS 证书
# bin/renew_cert.sh "trojan-docker的安装目录"
#------------------------------------------------

WORKDIR=$1
if [ -z "${WORKDIR}" ] ; then
  WORKDIR=`pwd`
fi

docker-compose down

sudo certbot renew
cat /etc/letsencrypt/live/*/fullchain.pem > ${WORKDIR}/cert/fullchain.pem
cat /etc/letsencrypt/live/*/privkey.pem > ${WORKDIR}/cert/privkey.pem

docker-compose up -d
