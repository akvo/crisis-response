#! /usr/bin/env sh
set -eu

# copy .env
cp ./.env.example ./.env

composer clear-cache

composer update --no-plugins

composer install --no-scripts

composer dump-autoload
