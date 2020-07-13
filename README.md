# base-setup

Project for a base setup of docker based services to run a server, incl.

- rev proxy (traefik)
- ssl termination (certbot)
- container management (portainer)

## Installation

- create external network via `docker network create traefik`
- create traefik certification placeholder with `touch data/acme.json`
- adjust access to that file with `chmod 600 data/acme.json`

- copy `credentials.env.sample` to `credentials.env` and enter CloudFlare account details
- copy `oidc.env.sample` to `oidc.env` and enter OIDC configuration details
- adjust following env variable to your needs:
  - `$ROOT_URL` need to point to the root url, e.g. `example.com`
  - `$PUID` will map the container to a user ID of your choice (you can get your own UID with `echo $UID`)
  - `$PGID` will map the container to a group ID of your choice (You can get your user group with
  `` sh getent group `whoami` ``
- execute `docker-compose up -d`
- done!!

## Forward Authentication

In order to enable forward authentication, first configure `oidc.env` with respective client information.

For each client to be protected, add the following label (replacing `${SERVICE_NAME}` with the name of the service):
`traefik.http.routers.${SERVICE_NAME}.middlewares=traefik-forward-auth`

NOTE: The OIDC client will need to have `https://auth.${ROOT_URL}/_oauth` configured as a valid redirect URL.

## Troubleshooting

### Log ACME DNS challenge

To log ACME DNS challenge output, just enable Traefik DEBUG log level in `traefik.yml`.

### Check certificate

`nmap -p 443 --script ssl-cert whoami.${ROOT_URL}`
