FROM ubuntu:latest

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:ondrej/apache2
RUN add-apt-repository -y ppa:ondrej/php

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
	apache2 \
	php7.2 \
	libapache2-mod-php7.2

RUN a2enmod php7.2

COPY apache.conf /etc/apache2/sites-enabled/000-default.conf
COPY index.php /var/www/app/

COPY httpd_foreground.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/httpd_foreground.sh
CMD ["httpd_foreground.sh"]

EXPOSE 80
