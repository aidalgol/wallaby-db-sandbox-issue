#!/bin/bash

echo 'Waiting for database to be ready...'
while ! pg_isready -q -h "$POSTGRES_HOST" -p 5432 -U postgres; do
  sleep 2
done

echo 'Waiting for Selenium to be ready...'
while ! [ "$(curl -sSL http://selenium:4444/wd/hub/status | jq -r '.value.ready')" == "true" ]; do
  sleep 2
done

# This hack is to workaround Firefox under docker-compose not resolving
# container hostnames.  Used in config/test_e2e.exs for the end-to-end tests.
export PHOENIX_IP4="$(ip -json -4 addr show eth0 | jq --raw-output .[1].addr_info[0].local)"

exec mix "$@"
