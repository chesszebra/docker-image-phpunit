FROM chesszebra/php:7.3-cli

# Run as root
USER root:root

# Install Tini
ENV TINI_VERSION v0.17.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /sbin/tini
RUN chmod +x /sbin/tini

# Add the entry point script
ADD usr/local/bin/docker-image-entrypoint.sh /usr/local/bin/docker-image-entrypoint

# Make it executable
RUN chmod +x /usr/local/bin/docker-image-entrypoint

# Copy over the configuration file for PHP
COPY usr/local/etc/php/php.ini /usr/local/etc/php/php.ini

# Configure the system
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
	wget

# Install phpunit
RUN wget https://phar.phpunit.de/phpunit-8.phar -O /usr/bin/phpunit \
 && chmod +x /usr/bin/phpunit

# Run the container as the configured user
USER php:php

# Execute the entry point
ENTRYPOINT ["/usr/local/bin/docker-image-entrypoint"]

# The default command to execute
CMD ["phpunit"]
