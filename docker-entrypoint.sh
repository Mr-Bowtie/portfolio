#!/bin/sh

set -e

# use to start container with out executing any commands immediately, useful for debugging
# sleep infinity

bundle check || bundle install

# server isnt shutting down nicely and managing this file lock, so Im manually doing it for now
file_path="./tmp/pids/server.pid"  # Replace with the actual path to your file

if [ -e "$file_path" ]; then
    rm "$file_path"
    echo "File deleted: $file_path"
else
    echo "No server lock to worry about"
fi
bin/rails db:prepare
bin/rails s -b 0.0.0.0
