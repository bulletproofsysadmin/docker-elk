#!/bin/sh


[ -e '/root/.firstrun/done' ] && exit 0

# wait for elasticsearch to start
sleep 8

rm -f /etc/rsyslog.d/listen.conf
#sed -i -e "s/{LOGSTASHLINK}/$LOGSTASH_1_PORT_9995_TCP_ADDR/g" /etc/rsyslog.d/15_logstashjson.conf

sed -i -e "s/{REDIS}/\"$REDIS_1_PORT_6379_TCP_ADDR\"/g" /etc/rsyslog.d/20_redis.conf

touch '/root/.firstrun/done'

