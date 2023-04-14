# builder image
FROM docker.io/antora/antora:3.1.2 as builder

ADD . /antora/

RUN antora generate --stacktrace site.yml

# runtime image
FROM registry.redhat.io/ubi8/httpd-24:1-256.1680797936

COPY --from=builder /antora/site/ /var/www/html/
