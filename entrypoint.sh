#!/bin/sh
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /myapp/tmp/pids/server.pid
yarn config set registry https://registry.npm.taobao.org
yarn install --check-files
# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"