FROM postgres:9.6.9
MAINTAINER Frankie <frankietsengit@gmail.com>
LABEL description="Postgresql_Slave" version="1.0" owner="Frankie.Tseng" created_at="2020/03/25"
ADD include/gosu /usr/bin/
RUN chmod +x /usr/bin/gosu

RUN su postgres && \
    mkdir -p /usr/local/pgsql-9.6.9/main/archive/

COPY include/docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["gosu", "postgres", "postgres"]
