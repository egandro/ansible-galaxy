#!/bin/bash

#without this the restore won't work
chmod 755 backups/* || true

docker compose cp backups/* gitlab:/home/git/data/backups
docker compose run --rm gitlab app:rake gitlab:backup:restore
docker compose up -d
