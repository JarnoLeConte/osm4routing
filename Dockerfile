FROM debian:jessie

RUN apt-get update
RUN apt-get install -y sudo libboost-all-dev libexpat1-dev python swig sqlite python-psycopg2 git make g++

RUN git clone https://github.com/Tristramg/osm4routing.git
RUN cd /osm4routing && sudo python setup.py install # will probably fail because the extension "_osm4routing_xml" is missing
RUN cd /osm4routing && sudo python setup.py install # try to build again

RUN apt-get purge -y --auto-remove git make g++

VOLUME /data
WORKDIR /data