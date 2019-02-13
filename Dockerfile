FROM elasticsearch:5.6

RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install analysis-phonetic
RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install analysis-icu

CMD service elasticsearch start
CMD service elasticsearch start
