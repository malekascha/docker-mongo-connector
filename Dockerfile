#This will prepare a elasticsearch node with mongo-connector enabled

FROM python:2.7
MAINTAINER yeasy@github


RUN pip install certifi
RUN pip install https://github.com/mongodb-labs/mongo-connector/archive/master.zip
RUN pip install https://github.com/mongodb-labs/elastic2-doc-manager/archive/master.zip

ENV DEBIAN_FRONTEND noninteractive

ENV ELASTICSEARCH=https://search-elastic-test-5d7q73lce7j53trxbq4fcsybyy.us-west-2.es.amazonaws.com
ENV MONGO=mongodb.dev.goalbook.local
ENV MONGOPORT=27017

# Installing Mongo Connector which will connect MongoDB and Elasticsearch

COPY startup.sh /tmp/
COPY config.json .

COPY mongo /usr/bin/
RUN chmod a+x /usr/bin/mongo

VOLUME /data


# Sample usage when no commands is given outside
CMD ["/bin/bash", "/tmp/startup.sh"]

