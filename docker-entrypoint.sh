#!/bin/sh

set -e

# use to start container with out executing any commands immediately, useful for debugging
# sleep infinity

bin/rails db:prepare
bin/rails s -b 0.0.0.0
