#!/bin/bash

bundler_setup() {
  # Bundler
  #
  # Installs Bundler using RVM. RVM allows us to install the
  # current version of ruby and all mailcatcher dependencies reliably.
  local pkg
  local bundler_version

  bundler_version="$(/usr/bin/env bundler --version 2>&1 | grep 'Bundler ' | cut -d " " -f 3)"
  if [[ -n "${bundler_version}" ]]; then
    echo " * Bundler installed"
  else
    echo " * Bundler [not installed]"
    /usr/bin/env rvm default do gem install bundler --no-rdoc --no-ri
  fi

}

echo "Installing more utilities"
bundler_setup
