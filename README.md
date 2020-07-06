# base-setup

Project for a base setup of docker based services to run a server, incl.

- rev proxy (traefik)
- ssl termination (certbot)
- container management (portainer)

## Installation

- create external network via `docker network create traefik`
- replace CloudFlare account details in `credentials.env`
- adjust domain name vie env variable `$ROOT_URL`
<!-- - get first certificate with `ROOT_URL=domedia.umschd.de docker-compose run --entrypoint=/initial_start.sh certbot` -->
- execute `ROOT_URL=domedia.umschd.de docker-compose up -d`
- done!!
