FROM postgres:9.6.9
MAINTAINER Frankie <frankietsengit@gmail.com>
LABEL description="Postgresql_Master"  version="1.0" owner="Frankie.Tseng" created_at="2020/03/25"
EXPOSE 5432
COPY include/setup-master.sh /docker-entrypoint-initdb.d/setup-master.sh
RUN chmod 0666 /docker-entrypoint-initdb.d/setup-master.sh

