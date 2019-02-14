FROM elasticsearch:5.6

RUN /usr/share/elasticsearch/bin/plugin install analysis-phonetic
RUN /usr/share/elasticsearch/bin/plugin install analysis-icu
