#!/bin/bash

export GRAILS_OPTS="-Xmx2G -Xms1G -XX:MaxPermSize=1G -server"

# fail if any line fails
set -e

date ; echo -e "\n"

./setup-frontend.sh

cd ModelCatalogueCorePluginTestApp

if [[ "$1" == "debug" ]]; then
    ./grailsw run-app --debug-fork
else
    ./grailsw run-app
fi

