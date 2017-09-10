FROM chesszebra/php:7.1

# Run as root
USER root:root

# Update PECL and install XDebug
RUN pecl update-channels \
 && pecl install xdebug \
 && docker-php-ext-enable xdebug

# Copy over the configuration file for PHP
COPY usr/local/etc/php/php.ini /usr/local/etc/php/php.ini

# Configure the system
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
	wget

# Install phpunit
RUN wget https://phar.phpunit.de/phpunit-6.2.phar -O /usr/bin/phpunit \
 && chmod +x /usr/bin/phpunit

# Run the container as the configured user
USER php:php

# Execute phpunit
ENTRYPOINT ["phpunit"]
