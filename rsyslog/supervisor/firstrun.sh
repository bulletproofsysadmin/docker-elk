#!/bin/sh


[ -e '/root/.firstrun/done' ] && exit 0

# wait for elasticsearch to start
sleep 8

sed -i -e "s/{LOGSTASHLINK}/$LOGSTASH_1_PORT_9995_TCP_ADDR/g" /etc/rsyslog.d/15_logstashjson.conf
touch '/root/.firstrun/done'

