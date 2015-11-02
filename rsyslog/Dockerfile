FROM centos:7
MAINTAINER "The Bulletproof Sysadmin" <the@bulletproofsysadmin.com>

COPY rsyslog-copr.repo /etc/yum.repos.d/rsyslog-copr.repo

COPY elasticsearch.repo /etc/yum.repos.d/elasticsearch.repo

RUN rpm --import https://packages.elasticsearch.org/GPG-KEY-elasticsearch


RUN yum update -y
RUN yum install rsyslog -y
RUN yum install epel-release -y
RUN yum install rsyslog-mmnormalize rsyslog-elasticsearch -y

RUN yum install \
	tar \
	supervisor -y 

COPY rsyslog.conf /etc/rsyslog.conf
COPY conf.d/00_normalize.conf /etc/rsyslog.d/00_normalize.conf

COPY conf.d/15_logstashjson.conf /etc/rsyslog.d/15_logstashjson.conf
#COPY conf.d/10_elasticsearch.conf /etc/rsyslog.d/10_elasticsearch.conf
COPY conf.d/rules-audit.rb /etc/rsyslog.d/rules-audit.rb
COPY conf.d/rules-httpderror.rb /etc/rsyslog.d/rules-httpderror.rb
COPY conf.d/rules-krb5-kdc.rb /etc/rsyslog.d/rules-krb5-kdc.rb
COPY conf.d/rules-ipa-389-access.rb /etc/rsyslog.d/rules-ipa-389-access.rb
COPY conf.d/rules-ipa-389-errors.rb /etc/rsyslog.d/rules-ipa-389-errors.rb
COPY conf.d/rules-sssd.rb /etc/rsyslog.d/rules-sssd.rb
COPY conf.d/rules-authpriv.rb /etc/rsyslog.d/rules-authpriv.rb

COPY supervisor/supervisord.conf /etc/supervisord.conf
COPY supervisor/rsyslog.ini /etc/supervisord.d/rsyslog.ini
COPY supervisor/firstrun.ini /etc/supervisord.d/firstrun.ini


COPY supervisor/firstrun.sh /root/.firstrun/firstrun.sh
RUN chmod u+x /root/.firstrun/firstrun.sh

RUN rm -f /etc/ryslog.d/listen.conf

EXPOSE 514/tcp 514/udp
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
