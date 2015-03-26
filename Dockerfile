FROM gsaulmon/php-fpm

RUN yum install -y php-pecl-xdebug

RUN echo xdebug.remote_enable=1 >> /etc/php.d/xdebug.ini;\
  echo xdebug.remote_autostart=0 >> /etc/php.d/xdebug.ini;\
  echo xdebug.remote_connect_back=1 >> /etc/php.d/xdebug.ini;\
  echo xdebug.remote_port=9000 >> /etc/php.d/xdebug.ini;

EXPOSE 9000

ENTRYPOINT ["php-fpm", "-F"]
