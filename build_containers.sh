#!/bin/bash

# probably should add some options later
# build the containers

printf "Building the containers ~\n"

# open5gs EPC/5GC components
docker build --no-cache --force-rm -t docker_open5gs base/.

# kamailio IMS components
docker build --no-cache --force-rm -t docker_kamailio ims_base/.

# srsRAN_4G eNB + srsUE (4G+5G)
docker build --no-cache --force-rm -t docker_srslte srslte/.

# srsRAN_Project gNB
docker build --no-cache --force-rm -t docker_srsran srsran/.

# UERANSIM (gNB + UE)
docker build --no-cache --force-rm -t docker_ueransim ueransim/.

