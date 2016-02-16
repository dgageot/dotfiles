#!/bin/bash

export DOCKER_MACHINE_PS1_SHOWSTATUS=1

# Make sure bash completion works
if [[ -f $(brew --prefix)/etc/bash_completion ]]; then
  if [[ ! -f $(brew --prefix)/etc/bash_completion.d/docker ]]; then
    echo "Download docker bash completion"
    curl -XGET https://raw.githubusercontent.com/docker/docker/master/contrib/completion/bash/docker > $(brew --prefix)/etc/bash_completion.d/docker
  fi
fi

# Docker Machine Google Driver
export GOOGLE_PROJECT="code-story-blog"
export GOOGLE_ZONE="europe-west1-d"
export GOOGLE_DISK_SIZE="100"
export GOOGLE_MACHINE_IMAGE="https://www.googleapis.com/compute/v1/projects/code-story-blog/global/images/docker"
