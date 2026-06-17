#!/bin/bash
# ============================================================
# Deployment Script for ez_aldeen - Shared Hosting
# Run this AFTER uploading files to your server via SSH
# ============================================================

echo "=== ez_aldeen Deployment Script ==="

# 1. Set permissions
echo "[1/7] Setting permissions..."
chmod -R 775 storage
chmod -R 775 bootstrap/cache

# 2. Create storage symlink
echo "[2/7] Creating storage symlink..."
php artisan storage:link

# 3. Clear all caches
echo "[3/7] Clearing caches..."
php artisan config:clear
php artisan view:clear
php artisan route:clear
php artisan cache:clear

# 4. Cache Backpack assets (basset)
echo "[4/7] Caching Backpack assets..."
php artisan basset:cache

# 5. Run migrations
echo "[5/7] Running migrations..."
php artisan migrate --force

# 6. Optimize for production
echo "[6/7] Optimizing for production..."
php artisan config:cache
php artisan route:cache
php artisan view:cache

# 7. Verify storage link
echo "[7/7] Verifying storage link..."
if [ -L "public/storage" ]; then
    echo "✓ Storage symlink OK"
else
    echo "✗ Storage symlink missing! Run: php artisan storage:link"
fi

echo ""
echo "=== Deployment Complete! ==="
echo "Visit your site at the APP_URL in .env"
echo ""
echo "IMPORTANT: Delete this file (deploy.sh) after running!"