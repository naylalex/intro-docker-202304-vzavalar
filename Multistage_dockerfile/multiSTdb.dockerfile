FROM bitnami/postgresql
COPY words.sql /docker-entrypoint-initdb.d/
ENV POSTGRES_HOST_AUTH_METHOD=trust 
#ENV POSTGRES_PASSWORD=withoutpassword