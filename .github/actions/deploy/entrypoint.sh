#!/bin/sh

mkdir ~/.gem #Rubygems needs this directory for auth
echo "---\n:rubygems_api_key: $RUBYGEMS_API_KEY" > ~/.gem/credentials #The file to store rubygems auth. Must be in this format
chmod 0600 ~/.gem/credentials #Rubygems expects this permissions
gem build *.gemspec
gem push *.gem -k rubygems
