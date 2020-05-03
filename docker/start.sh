#!/usr/bin/env bash

set -e

role=${CONTAINER_ROLE:-app}
env=${APP_ENV:-production}
path=${APP_PATH:-/var/www/html}

if [ "$env" == "production" ]; then
    echo "Caching configuration..."
    (cd $path && php artisan config:cache && php artisan route:cache && php artisan view:cache)
fi

if [ "$role" = "app" ]; then

    exec php-fpm7.3

elif [ "$role" = "queue" ]; then

    echo "Running the queue..."
    php "$path/artisan" queue:work --verbose --tries=3 --timeout=90 --sleep=1

elif [ "$role" = "scheduler" ]; then

    while [ true ]
    do
      php "$path/artisan" schedule:run --verbose --no-interaction &
      sleep 60
    done

else
    echo "Could not match the container role \"$role\""
    exit 1
fi
