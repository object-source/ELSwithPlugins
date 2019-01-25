FROM elasticsearch:5.6

RUN /usr/share/elasticsearch/bin/plugin install analysis-phonetic
RUN /usr/share/elasticsearch/bin/plugin install analysis-icu

COPY docker-healthcheck /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-healthcheck

HEALTHCHECK CMD ["docker-healthcheck"]
