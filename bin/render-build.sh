#!/usr/bin/env bash
# Exit script on error
set -o errexit

# Install dependencies
bundle install

# Precompile assets
bundle exec rails assets:precompile

# Clean assets (optional)
bundle exec rails assets:clean
