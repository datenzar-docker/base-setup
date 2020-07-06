# base-setup

Project for a base setup of docker based services to run a server, incl.

- rev proxy (traefik)
- ssl termination (certbot)
- container management (portainer)

## Installation

- create external network via `docker network create traefik`
- replace CloudFlare account details in `credentials.env`
- adjust following env variable to your needs:
  - `$ROOT_URL` need to point to the root url, e.g. `example.com`
  - `$PUID` will map the container to a user ID of your choice (you can get your own UID with `echo $UID`)
  - `$PGID` will map the container to a group ID of your choice (You can get your user group with
  `` sh getent group `whoami` ``
  <!-- - get first certificate with `ROOT_URL=domedia.umschd.de docker-compose run --entrypoint=/initial_start.sh certbot` -->
- execute `ROOT_URL=domedia.umschd.de docker-compose up -d`
- done!!

## Troubleshooting

### Log ACME DNS challenge

To log ACME DNS challenge output, just enable Traefik DEBUG log level in `traefik.yml`.

### Check certificate

`nmap -p 443 --script ssl-cert whoami.${ROOT_URL}`
