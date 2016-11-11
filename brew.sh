#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

brew install binwalk
brew install bvi
brew install coreutils
brew install dpkg
brew install exiftool
brew install exploitdb
brew install fcrackzip
brew install hashpump
brew install html2text
brew install hydra
brew install jad
brew install john
brew install ldid
brew install lftp
brew install lzip
brew install mc
brew install nmap
brew install npm
brew install pillow
brew install pngcheck
brew install pyenv-virtualenv
brew install pwgen
brew install qemu
brew install radare2
brew install rtorrent
brew install scapy
brew install socat
brew install sqlitebrowser
brew install sqlmap
brew install ssh-copy-id
brew install tree
brew install upx
brew install unrar
brew install vbindiff
brew install wget

# Remove outdated versions from the cellar.
brew cleanup
