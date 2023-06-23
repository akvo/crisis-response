#! /usr/bin/env sh
set -eu

# copy .env
cp ./.env.example ./.env

# sed .env value
sed -i "s|APP_ENV=\"\${APP_ENV}\"|APP_ENV=\"$(echo $APP_ENV | sed 's/\//\\\//g')\"|" .env
sed -i "s|APP_KEY=\"\${APP_KEY}\"|APP_KEY=\"$(echo $APP_KEY | sed 's/\//\\\//g')\"|" .env
sed -i "s|APP_DEBUG=\"\${APP_DEBUG}\"|APP_DEBUG=\"$(echo $APP_DEBUG | sed 's/\//\\\//g')\"|" .env

sed -i "s|DB_DATABASE=\"\${DB_DATABASE}\"|DB_DATABASE=\"$(echo $DB_DATABASE | sed 's/\//\\\//g')\"|" .env
sed -i "s|DB_USERNAME=\"\${DB_USERNAME}\"|DB_USERNAME=\"$(echo $DB_USERNAME | sed 's/\//\\\//g')\"|" .env
sed -i "s|DB_PASSWORD=\"\${DB_PASSWORD}\"|DB_PASSWORD=\"$(echo $DB_PASSWORD | sed 's/\//\\\//g')\"|" .env
sed -i "s|DB_HOST=\"\${DB_HOST}\"|DB_HOST=\"$(echo $DB_HOST | sed 's/\//\\\//g')\"|" .env
sed -i "s|DB_PORT=\"\${DB_PORT}\"|DB_PORT=\"$(echo $DB_PORT | sed 's/\//\\\//g')\"|" .env

sed -i "s|AKVO_FLOW_WEB_API=\"\${AKVO_FLOW_WEB_API}\"|AKVO_FLOW_WEB_API=\"$(echo $AKVO_FLOW_WEB_API | sed 's/\//\\\//g')\"|" .env
sed -i "s|AKVO_INSTANCE=\"\${AKVO_INSTANCE}\"|AKVO_INSTANCE=\"$(echo $AKVO_INSTANCE | sed 's/\//\\\//g')\"|" .env
sed -i "s|AKVO_CLIENT_ID=\"\${AKVO_CLIENT_ID}\"|AKVO_CLIENT_ID=\"$(echo $AKVO_CLIENT_ID | sed 's/\//\\\//g')\"|" .env
sed -i "s|AKVO_USERNAME=\"\${AKVO_USERNAME}\"|AKVO_USERNAME=\"$(echo $AKVO_USERNAME | sed 's/\//\\\//g')\"|" .env
sed -i "s|AKVO_PASSWORD=\"\${AKVO_PASSWORD}\"|AKVO_PASSWORD=\"$(echo $AKVO_PASSWORD | sed 's/\//\\\//g')\"|" .env


sed -i "s|CLEAN_PASSWORD=\"\${CLEAN_PASSWORD}\"|CLEAN_PASSWORD=\"$(echo $CLEAN_PASSWORD | sed 's/\//\\\//g')\"|" .env
sed -i "s|MIX_PUBLIC_URL=\"\${MIX_PUBLIC_URL}\"|MIX_PUBLIC_URL=\"$(echo $MIX_PUBLIC_URL | sed 's/\//\\\//g')\"|" .env

awk -v var="$MAPS_GOOGLE_APIS" '/^MAPS_GOOGLE_APIS/{$0="MAPS_GOOGLE_APIS=\"" var "\""} 1' .env > .env.temp && mv .env.temp .env
# eol sed .env value

composer clear-cache

composer update --no-plugins

composer install --no-scripts

composer dump-autoload
