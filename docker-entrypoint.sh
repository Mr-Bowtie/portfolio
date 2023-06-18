#!/bin/sh

set -e

# use to start container with out executing any commands immediately, useful for debugging
# sleep infinity

# server isnt shutting down nicely and managing this file lock, so Im manually doing it for now
rm ./tmp/pids/server.pid
bin/rails db:prepare
bin/rails s -b 0.0.0.0
