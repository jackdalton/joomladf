FROM ubuntu

MAINTAINER Jack Dalton <jack@jackdalton.org>

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y apache2 mysql-server php7.2 libapache2-mod-php php7.2-cli php7.2-common php7.2-mbstring php7.2-gd php7.2-intl php7.2-xml php7.2-mysql php7.2-zip php7.2-curl php7.2-xmlrpc git

RUN mysql -u root -e "CREATE DATABASE joomla;"
RUN mysql -u root -e "GRANT ALL PRIVILEGES on joomla.* to 'joomla_user'@'localhost' identified by 'Welcome1';"
RUN mysql -u root -e "FLUSH PRIVILEGES;"

RUN rm -rf /var/www/html/*
RUN git clone https://github.com/joomla/joomla-cms.git /var/www/html/
RUN cp /var/www/html/htaccess.txt /var/www/html/.htaccess
RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html
RUN a2enmod rewrite

EXPOSE 80
