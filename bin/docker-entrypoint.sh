#!/bin/sh
set -e

echo "PATH: $PATH"
echo "$(pwd)"
bundle install 
exec "$@"
