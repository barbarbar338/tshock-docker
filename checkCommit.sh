#!/bin/bash

exit $(curl -s https://api.github.com/repos/Pryaxis/Tshock/commits/heads/general-devel | jq -r "((now - (.commit.author.date | fromdateiso8601) )  / (60*60*24)  | trunc)")
