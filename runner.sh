#!/bin/bash

# Create config
bash config.sh

# Run the app
./TShock.Server \
    -configpath /tshock \
    -logpath /tshock/logs \
    -crashdir /tshock/crashes \
    -worldselectpath /worlds \
    -additionalplugins /plugins \
    -config serverconfig.txt
