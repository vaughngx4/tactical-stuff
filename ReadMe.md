# Scripts & Other Tactical RMM (TRMM) Stuff

> A few extras for Tactical RMM

## Docker

### Update Script (docker/update.sh)

- Updates to latest compose file.
- Removes and pulls new images.
- Requires certs.sh to bring tactical back up again.

### Certificate Script (docker/certs.sh)

- Used to change certificates in an active installation (brings containers down)
- Expects certificates in trmmcert.tar.gz as trmmcert/fullchain.pem and trmmcert/privatekey.pem
- Requires certs.sh to bring tactical back up again.
- NOTE: Change /home/user/trmm/ in the certs.sh script to the directory certs.sh is in (along with trmmcert.tar.gz). This allows the script to be run over ssh (ssh user@10.0.0.5 'bash -c /path/to/certs.sh') without any errors.

## Unsupported Configurations
> See <https://docs.tacticalrmm.com> for more info and/or if you're having issues with mesh and HAProxy.

### HAProxy
> Latest configuration confirmed working with tactical (pfsense config, but is applicable for all HAProxy installs).

- Configure certificates for HAProxy as the same certificates in trmm(see certs.sh for updating trmm certs)
- Edit domains and IPs in config file before using.
- Includes config for www.example.com to show how to manage a secondary certificate (for other non-trmm related https services, remove if unused).

## Official Community

- [Official Chat Room - Discord](https://discord.gg/upGTkWp)

