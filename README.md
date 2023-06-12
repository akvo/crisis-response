# Crisis Response

## Container

This project will run following container:

-   `nginx`
-   `ui`
-   `app`
-   `db`

## Initial Data Seed

To seed the initial data do database, run following command inside `docker-compose exec app bash`

-   `php artisan migrate`
-   `php artisan flow:init`
-   `php artisan flow:bridge`
