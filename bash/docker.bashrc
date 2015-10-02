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

# Make sure bash completion works
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  if [ ! -f $(brew --prefix)/etc/bash_completion.d/docker ]; then
    echo "Download docker bash completion"
    curl -XGET https://raw.githubusercontent.com/docker/docker/master/contrib/completion/bash/docker > $(brew --prefix)/etc/bash_completion.d/docker
  fi
fi
