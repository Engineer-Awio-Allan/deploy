#!/usr/bin/env bash

# Exit immediately if any command fails
set -o errexit

# Install dependencies
bundle install

# Precompile Rails assets
bundle exec rails assets:precompile

# Clean up old assets
bundle exec rails assets:clean