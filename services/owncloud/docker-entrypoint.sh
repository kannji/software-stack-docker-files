#!/bin/bash
set -e

mkdir -p /var/www/html/owncloud

if [ ! -e '/var/www/html/owncloud/version.php' ]; then
	cp -r /usr/src/owncloud/* /var/www/html/owncloud
	chown -R www-data /var/www/html
fi

exec "$@"