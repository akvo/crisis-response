#! /usr/bin/env sh
set -eu

composer clear-cache

composer update --no-plugins

composer install --no-scripts

composer dump-autoload