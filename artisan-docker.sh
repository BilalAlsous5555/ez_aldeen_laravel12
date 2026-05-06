#!/bin/bash
MSYS_NO_PATHCONV=1 docker exec ez_aldeen-app php artisan "$@"
