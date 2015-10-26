FROM elasticsearch:latest

RUN set -x \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends git python python-dev

RUN git clone https://github.com/Yelp/elastalert.git

WORKDIR elastalert

RUN cd /elastalert python setup.py install

RUN plugin -i elasticsearch/marvel/latest
