#!/usr/bin/env sh

command -v ~/google-cloud-sdk/bin/gcloud >/dev/null 2>&1
if [ "$?" -ne "0" ]; then
  echo "Install gcloud"
  curl https://sdk.cloud.google.com | bash
fi

command -v brew >/dev/null 2>&1
if [ "$?" -ne "0" ]; then
    echo 'Install Homebrew: http://brew.sh/'
    exit 1
fi

brew update
brew doctor
brew upgrade
brew bundle

# Install terminal tools
#
if [ ! -f $(brew --prefix)/bin/gitx ]; then
	echo "Install gitx terminal tool"
	ln -s /opt/homebrew-cask/Caskroom/gitx/latest/GitX.app/Contents/Resources/gitx $(brew --prefix)/bin/gitx
fi

# Configure jenv
#
eval "$(jenv init -)"
jenv enable-plugin export
jenv enable-plugin ant
jenv enable-plugin golo
jenv enable-plugin gradle
jenv enable-plugin groovy
jenv enable-plugin maven
