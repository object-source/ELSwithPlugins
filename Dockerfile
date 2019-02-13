FROM ubuntu:14.04


ENV HOST localhost

# Install wget, curl, and add-apt-repository tool
RUN apt-get update; \
  apt-get install -y wget software-properties-common curl apt-transport-https

# Add repo (Java and ES 1.5)
RUN add-apt-repository ppa:openjdk-r/ppa; \
  wget -O - http://packages.elastic.co/GPG-KEY-elasticsearch | apt-key add -; \
  echo "deb https://artifacts.elastic.co/packages/5.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-5.x.list

# Install Java and ElasticSearch
RUN apt-get update; \
  apt-get install -y openjdk-8-jdk elasticsearch;

# Install plugins for ES module for Magento to work
RUN /usr/share/elasticsearch/bin/plugin -i mobz/elasticsearch-head; \
  /usr/share/elasticsearch/bin/plugin -i lmenezes/elasticsearch-kopf/v1.6.1; \
  /usr/share/elasticsearch/bin/plugin -i elasticsearch/elasticsearch-analysis-icu/2.5.0; \
  /usr/share/elasticsearch/bin/plugin -i elasticsearch/elasticsearch-analysis-phonetic/2.5.0; \
  /usr/share/elasticsearch/bin/plugin -i elasticsearch/elasticsearch-analysis-smartcn/2.5.0;

# Auto run when system is on
RUN update-rc.d elasticsearch defaults

# Overwrite settings
ENTRYPOINT service elasticsearch start && /bin/bash

EXPOSE 9200 9300
