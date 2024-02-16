#!/bin/bash
#todo
# build locally if local arg or no arg and not .yml file
if [ -z "$1" ] || [ "$1" == "local" ]; then
    printf "Building locally ~\n"
    docker build --no-cache --force-rm -t docker_open5gs base/.
    docker build --no-cache --force-rm -t docker_kamailio ims_base/.
    docker build --no-cache --force-rm -t docker_srslte srslte/.
    docker build --no-cache --force-rm -t docker_srsran srsran/.
    docker build --no-cache --force-rm -t docker_ueransim ueransim/.
    exit 0
fi

# build using a compose file when arg is ending with yml
if [[ "$1" == *".yml" ]]; then
    printf "Building using compose file ~\n"
    docker-compose -f $1 build
    exit 0
elif [[ "$1" == "all" ]]; then
    # run script without argument when arg is gibberish
    printf "using deploy-all.yml"
    docker compose -f deploy-all.yaml up -d
    exit 0
fi

