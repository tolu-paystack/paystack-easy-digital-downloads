FROM ubuntu:18.04 AS builder

WORKDIR /dist

RUN apt-get -y install && apt-get update
RUN apt-get -y install wget unzip zip

ADD https://downloads.wordpress.org/plugin/easy-digital-downloads.latest-stable.zip /dist
RUN cd /dist && unzip easy-digital-downloads.latest-stable.zip && rm easy-digital-downloads.latest-stable.zip


FROM wordpress:php7.2

WORKDIR /var/www/html/

COPY . ./wp-content/plugins/paystack
COPY --from=builder /dist/ ./wp-content/plugins
