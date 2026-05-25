#!/bin/sh
set -e

# Fix storage symlink for volume mount
rm -f /var/www/html/public/storage
ln -s /var/www/html/storage/app/public /var/www/html/public/storage

# Fix permissions for volume-mounted directories
chown -R www-data:www-data /var/www/html/storage
chmod -R 775 /var/www/html/storage
chown -R www-data:www-data /var/www/html/bootstrap/cache
chmod -R 775 /var/www/html/bootstrap/cache

# Clear caches
php artisan optimize:clear

exec "$@"