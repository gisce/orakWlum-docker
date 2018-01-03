# orakWlum-docker
Docker files for orakWlum!

It integrates a docker composition project that starts all the involved elements to run the orakWlum.

## Project elements

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




## Build a new okW image

Use ```build_new_version.sh``` util to deploy new releases of the orakWlum!

```
$ ./build_new_version.sh <SERVICE> <TAG_BRANCH>
``` 
- ```$SERVICE``` can be "api" or "frontend"
- ```TAG_BRANCH``` is optional, and points to the TAG or BRANCH name
  - Default value is "master"


## Change the active okW image!

Use ```change_version.sh``` util to activate a different TAG of an existing service image

```
$ ./change_version.sh <SERVICE> <TAG>
``` 
- ```$SERVICE``` can be "api" or "frontend"
- ```TAG``` points to the existing image TAG


## Examples

### Building the last api version and activating it
```
$ ./build_new_version.sh api master 

$ ./change_version.sh api master 
``` 

### Building v0.8.0 of frontend
```
$ ./build_new_version.sh frontend v0.8.0 

$ ./change_version.sh frontend v0.8.0 
``` 
