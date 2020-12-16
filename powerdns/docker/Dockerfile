FROM alpine

ENV MYSQL_USER=pdns
ENV MYSQL_PASSWORD=pdns
ENV MYSQL_DATABASE=pdns
ENV MYSQL_HOST=localhost
ENV API_KEY=changeme

RUN apk update
RUN apk add pdns-backend-mysql

COPY ./files/pdns.conf /etc/pdns/pdns.conf
COPY ./sql/mysql-schema-4.3.sql /mysql-schema.sql
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 53/udp
EXPOSE 53/tcp
EXPOSE 8081

ENTRYPOINT ["/bin/ash", "/entrypoint.sh"]
