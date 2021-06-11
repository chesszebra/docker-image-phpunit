#!/usr/bin/env bash

# check if the first argument passed in looks like a flag
if [ "$(printf %c "$1")" = '-' ]; then
  set -- /sbin/tini -- phpunit "$@"
# check if the first argument passed in is the application name
elif [ "$1" = "phpunit" ]; then
  set -- /sbin/tini -- "$@"
fi

exec "$@"
