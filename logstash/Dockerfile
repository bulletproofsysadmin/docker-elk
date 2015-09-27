FROM logstash:latest
CMD mkdir -p /etc/logstash
CMD cd /etc/logstash
WORKDIR /etc/logstash
RUN curl -O "http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz"

RUN gunzip /etc/logstash/GeoLiteCity.dat.gz

EXPOSE 9995
