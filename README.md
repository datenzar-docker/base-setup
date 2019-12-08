# base-setup

Project for a base setup of docker based services to run a server, incl.

- rev proxy (traefik)
- ssl termination (certbot)
- container management (portainer)

## Installation

- replace account details in credentials.txt
- adjust domain names in `dyn-traefik.yml`
- get first certificate with `ROOT_URL=domedia.umschd.de docker-compose run --entrypoint=/initial_start.sh certbot`
- execute `ROOT_URL=domedia.umschd.de docker-compose up -d`
- done!!
