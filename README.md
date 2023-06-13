# Crisis Response

---

## Development

### 1. Environment Setup

You should have environment setup as below:

**Seed & Sync Auth**

This app requires [Akvo Flow API Authentication](https://github.com/akvo/akvo-flow-api/wiki/Akvo-SSO-login) to provides correct credentials when seed or sync form and data points from Akvo FLOW.

```
export AKVO_CLIENT_ID="string"
export AKVO_USERNAME="string"
export AKVO_PASSWORD="string"
```

**Akvo Instance - Akvo FLOW Web API - Maps Google API**

```
export AKVO_INSTANCE="string"
export AKVO_FLOW_WEB_API="string"
export MAPS_GOOGLE_APIS="string"
```

### 2. Start the App

Now you have all the required environment ready, then run the App using:

```
./dc.sh up -d
```

To stop:

```
./dc.sh down -t 1
```

Reset the app:

```
./dc.sh down -v
```

_Docker Container_

This project will run following container:

-   `nginx`
-   `ui`
-   `app`
-   `db`

The app should be running at: [localhost:3000](http://localhost:3000/)

### 3. Initial Data Seed

To seed the initial data do database, run following command inside `./dc.sh exec app bash`

-   `php artisan migrate`
-   `php artisan flow:init`
-   `php artisan flow:bridge`
