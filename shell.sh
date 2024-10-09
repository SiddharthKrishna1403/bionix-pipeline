#!/bin/bash
docker-compose up -d
docker-compose exec bionix-pipeline enter-nix-shell
