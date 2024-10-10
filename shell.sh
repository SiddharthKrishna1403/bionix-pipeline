#!/bin/bash
docker-compose up -d
docker-compose exec bionix-pipeline 
/usr/local/bin/enter-nix-shell
