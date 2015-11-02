FROM logstash:latest
CMD mkdir -p /etc/logstash
CMD cd /etc/logstash
WORKDIR /etc/logstash
RUN curl -O "http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz"
ADD patterns/* /opt/logstash/vendor/bundle/jruby/1.9/gems/logstash-patterns-core-0.3.0/patterns/
RUN gunzip /etc/logstash/GeoLiteCity.dat.gz
RUN /opt/logstash/bin/plugin install logstash-filter-translate


#Add certificates
ADD certs/* /tmp/
RUN chown -R logstash /tmp/*.pem
RUN chmod 777 /tmp/*.pem


EXPOSE 9995
