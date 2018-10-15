#!/bin/bash
set -e

if [ "$JEKYLL_NEW" = true ]; then
  echo "=> Creating new Jekyll Site"
  jekyll new .
fi

if [ ! -f Gemfile ]; then
  echo "=> No Jekyll site found in current directory"
  echo "=> Create a new site with JEKYLL_NEW=true"
  exit 1
fi

bundle install

exec "$@"