#!/bin/sh

bundle exec rake generate_secret_token

bundle exec rake db:migrate