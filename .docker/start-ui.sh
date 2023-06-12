#! /usr/bin/env sh
set -eu

npm cache clean --force

npm update

npm install

npm run watch