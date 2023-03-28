#!/bin/bash
bundle check || bundle install
rm tmp/pids/server.pid
bundle exec rails s -p 3030 -b 0.0.0.0