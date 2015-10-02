#!/bin/bash

if [ ! -f /usr/local/bin/docker-machine ]; then
  echo "Install Docker Toolbox first. https://www.docker.com/toolbox"
else
  # Start default docker machine if need be
  if [ "$(docker-machine status default 2>/dev/null)" != "Running" ]; then
    docker-machine start default
  fi

  # Set environment variables
  eval "$(docker-machine env default)"
fi
