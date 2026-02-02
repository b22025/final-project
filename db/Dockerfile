FROM mcr.microsoft.com/mssql/server:2022-latest
USER root

COPY schema.sql /docker-entrypoint-initdb.d/01-schema.sql

