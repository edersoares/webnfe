# API Install

echo "[WebNF-e] API install.."
echo "[API] Composer install.."
docker run --rm -v $(pwd)/application/api:/application/api -w /application/api composer install

docker run --rm \
    -v $(pwd)/application/api:/application/api \
    -w /application/api \
    php bash -c "
        echo '[API] Creating database..'
        touch database/database.sqlite
        echo '[API] Permissions..'
        chmod -R 777 storage
        chmod -R 777 bootstrap/cache
        echo '[API] Key..'
        php artisan key:generate
        echo '[API] Migration..'
        php artisan migrate
    "

echo "[WebNF-e] Client install.."
echo "[Client] NPM install.."
docker run --rm \
    -v $(pwd)/application/client:/application/client \
    -w /application/client \
    node npm install