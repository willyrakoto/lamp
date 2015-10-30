FROM debian:wheezy
RUN echo 'phpmyadmin phpmyadmin/dbconfig-install boolean false' | debconf-set-selections
RUN echo 'phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2' | debconf-set-selections
RUN apt-get update -y && apt-get install -y \
apache2 \
libapache2-mod-php5 \
phpmyadmin
ADD config-db.php /etc/phpmyadmin/config-db.php
CMD ["/bin/bash", "-c", "source /etc/apache2/envvars && exec /usr/sbin/apache2 -DFOREGROUND"]
