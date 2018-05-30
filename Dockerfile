FROM gsaulmon/php-fpm

RUN yum install -y php-pecl-xdebug php-pear php-devel gcc make

RUN pecl install xdebug-2.5.5

RUN echo zend_extension=/usr/lib64/php/modules/xdebug.so >> /etc/php.d/xdebug.ini\
  echo xdebug.remote_enable=1 >> /etc/php.d/xdebug.ini;\
  echo xdebug.remote_autostart=0 >> /etc/php.d/xdebug.ini;\
  echo xdebug.remote_connect_back=1 >> /etc/php.d/xdebug.ini;\
  echo xdebug.remote_port=9000 >> /etc/php.d/xdebug.ini;

EXPOSE 9000

ENTRYPOINT ["php-fpm", "-F"]
