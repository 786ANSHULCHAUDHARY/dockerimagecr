ARG VERSION=22.04
FROM ubuntu:${VERSION}
MAINTAINER "anshul"
RUN apt update && apt install -y nginx curl
COPY index.html /usr/share/nginx/html
ADD index.html /var/www/html
VOLUME /var/www/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
HEALTHCHECK CMD curl --fail http://localhost:80/ || exit 1
