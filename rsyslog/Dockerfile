FROM centos:7
MAINTAINER "The Bulletproof Sysadmin" <the@bulletproofsysadmin.com>

COPY rsyslog-copr.repo /etc/yum.repos.d/rsyslog-copr.repo

COPY elasticsearch.repo /etc/yum.repos.d/elasticsearch.repo

RUN rpm --import https://packages.elasticsearch.org/GPG-KEY-elasticsearch


RUN yum update -y
RUN yum groupinstall "Development Tools" -y
RUN yum install epel-release -y
RUN yum install rsyslog-mmnormalize rsyslog-elasticsearch -y

RUN yum install \
	tar \
	supervisor -y 

RUN yum install \
	libestr-devel \
	libestr \
	hiredis \
	hiredis-devel \
	json-c \
	json-c-devel \
	zlib \
	zlib-devel \
	uuid \
	uuid-devel \
	libuuid \
	libuuid-devel \
	libgcrypt-devel \
	liblogging-stdlog-devel \
	python-docutils -y

WORKDIR /root/rsyslog

RUN autoreconf -fvi
RUN ./configure --enable-omhiredis
RUN make
RUN make install

RUN git clone https://github.com/rsyslog/rsyslog /root/rsyslog

RUN ./root/rsyslog/configure

COPY rsyslog.conf /etc/rsyslog.conf
COPY conf.d/00_normalize.conf /etc/rsyslog.d/00_normalize.conf


COPY conf.d/20_redis.conf /etc/rsyslog.d/20_redis.conf
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
