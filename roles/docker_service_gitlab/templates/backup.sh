#!/bin/bash

docker compose rm -sf gitlab
docker compose run --rm gitlab app:rake gitlab:backup:create
docker compose up -d
docker compose cp gitlab:/home/git/data/backups backups
