FROM elasticsearch:5.6

RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install analysis-phonetic
RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install analysis-icu
RUN apt-get update && apt-get install procps

RUN service elasticsearch restart
