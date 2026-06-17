#!/bin/bash
# ============================================================
# Deployment Script for ez_aldeen - Shared Hosting
# Run this AFTER uploading files to your server via SSH
# ============================================================

echo "=== ez_aldeen Deployment Script ==="

echo "[1/8] Setting permissions..."
chmod -R 775 storage
chmod -R 775 bootstrap/cache

echo "[2/8] Creating storage symlink..."
rm -f public/storage
php artisan storage:link 2>/dev/null
if [ ! -L "public/storage" ]; then
    echo "  Symlink failed. Copying files instead..."
    cp -r storage/app/public public/storage
    echo "  Files copied to public/storage"
else
    echo "  Symlink OK"
fi

echo "[3/8] Clearing all caches..."
php artisan optimize:clear

echo "[4/8] Caching Backpack assets..."
php artisan basset:cache

echo "[5/8] Running migrations..."
php artisan migrate --force

echo "[6/8] Seeding admin account..."
php artisan db:seed --class=AdminUserSeeder --force

echo "[7/8] Optimizing for production..."
php artisan config:cache
php artisan route:cache
php artisan view:cache

echo "[8/8] Verifying..."
if [ -L "public/storage" ] || [ -d "public/storage" ]; then
    echo "  Storage link OK"
else
    echo "  WARNING: public/storage missing!"
fi

echo ""
echo "=== Deployment Complete! ==="
echo "Login: your-domain.com/admin"
echo "Email: moder@ezaldeen.com"
echo "Password: 1122ezaldeenX2026"
echo ""
echo "IMPORTANT: Delete deploy.sh and fix_storage.php after running!"