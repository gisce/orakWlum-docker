# orakWlum-docker
Docker project for the orakWlum!

It integrates a docker composition project that starts all the involved elements to run the orakWlum.

## Project elements

The deployed versions and all docker project related configurations are handled inside the `.env` file:
```
FRONTEND_VERSION=$FRONTEND_TAG
API_VERSION=$API_TAG
DOMAIN=example.com
ADMIN_EMAIL=hello@gisce.net
``` 

- `nginx` main webserver
  - it provides the access layer integrated with the _let's encrypt_ engine
  - at every startup it reviews if the configred SSL/TLS vhosts needs a certificate renewal, if needed automatically handle it to ensure that no human intervention is needed to keep update it
  - also create a vhost for each docker element with a VIRTUAL_HOST definition
  - to avoid bugs with `websocket` it provides a direct proxy to the API (double webservers jump brokes websocket implementation)
  - configuration template can be altered through `config/nginx/nginx.tmpl`
- `frontend`
  - it provides the `okW frontend` webserver with their special rules applicated
  - configuration can be modified through `config/frontend/frontend.conf`
  - logs are saved to `logs/frontend`
- `api`
  - it runs the `okW API` using the uWSGI app server
  - `uWSGI` configuration can be changed using `config/api/api.ini`
  - `API` configuration can be changed using `config/api/config.py`
  - logs are saved to `logs/api`
- `mongodb` DB
  - it runs `mongodb` using the DB deployed at `volumes/mongodb`
  - logs are saved to `logs/mongodb`
- `redis` DB
  - it runs `redis` to provide the queues and caching server
  - logs are saved to `logs/redis`


### Auxiliar elements

- `frontend-src`
  - used to compile the requested version of the frontend inside `volumes/frontend`, the one that will be served by the `frontend`
- `nginx-gen`
  - used to prepare the `nginx` configuration based on our composition, it uses the `config/nginx/nginx.tmpl` template
- `letsencrypt-nginx-proxy-companion`
  - used to simplify the _let's encrypt_ management
  - it review and ensure that the defined SSL certificates are up to date at `volumes/nginx/certs`


## Usage 

### Start and stop orakWlum

#### Start
```
$ docker-compose up
```
#### Stop
```
$ docker-compose down
```


### Build a new okW image

Just change the `.env` values, and force a new build calling

```
$ docker-compose build
``` 

This just will create the new images, so the availability of the service is guaranteed.

To propagate the changes, [apply it!](#apply-the-latest-changes)


### Apply the latest changes

Simply turn off and on all the env with:

```
$ docker-compose down
$ docker-compose up
``` 

## Step by step build

Fresh deployments needs some fine tunning, due to the initial tagging of latest images (not covered by docker-compose):

```
# Ensure orakwlum base image is build!
$ docker build services/base -t okw/orakwlum-base:1.1.0

# Build API and tag it
$ docker-compose build api
$ docker tag okw/api:$LAST_TAG okw/api:latest

# Build all okW elements once the latest tag is performed
$ docker-compose build
```

