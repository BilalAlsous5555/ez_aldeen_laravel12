#!/bin/bash
echo "Clearing Laravel caches..."
MSYS_NO_PATHCONV=1 docker exec ez_aldeen-app php artisan config:clear
MSYS_NO_PATHCONV=1 docker exec ez_aldeen-app php artisan route:clear
MSYS_NO_PATHCONV=1 docker exec ez_aldeen-app php artisan view:clear
MSYS_NO_PATHCONV=1 docker exec ez_aldeen-app php artisan cache:clear

echo "Restarting PHP-FPM..."
MSYS_NO_PATHCONV=1 docker exec ez_aldeen-app kill -USR2 1

echo "Done! Your code changes are now live."
