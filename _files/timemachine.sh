#!/usr/bin/env bash

set -e

# This file sets exclusions for Time Machine backups.
# You must run this file with `sudo timemachine.sh`.

tmutil addexclusion -p /Applications
tmutil addexclusion -p /Library
tmutil addexclusion -p /opt/homebrew
tmutil addexclusion -p /private
tmutil addexclusion -p /System
tmutil addexclusion -p /usr/local
tmutil addexclusion -p ~/.android
tmutil addexclusion -p ~/.asdf
tmutil addexclusion -p ~/.bundle
tmutil addexclusion -p ~/.cache
tmutil addexclusion -p ~/.cocoapods
tmutil addexclusion -p ~/.composer
tmutil addexclusion -p ~/.electron
tmutil addexclusion -p ~/.gradle
tmutil addexclusion -p ~/.kerl
tmutil addexclusion -p ~/.local
tmutil addexclusion -p ~/.m2
tmutil addexclusion -p ~/.node-gyp
tmutil addexclusion -p ~/.npm
tmutil addexclusion -p ~/.nvm
tmutil addexclusion -p ~/.solargraph
tmutil addexclusion -p ~/.vagrant.d
tmutil addexclusion -p ~/.vpython-root
tmutil addexclusion -p ~/.vscode
tmutil addexclusion -p ~/.vscode-insiders
tmutil addexclusion -p ~/Downloads
tmutil addexclusion -p ~/Library/Android
tmutil addexclusion -p ~/Library/Application\ Support/Adobe
tmutil addexclusion -p ~/Library/Application\ Support/Bartalina
tmutil addexclusion -p ~/Library/Application\ Support/Blackmagic\ Design
tmutil addexclusion -p ~/Library/Application\ Support/BraveSoftware
tmutil addexclusion -p ~/Library/Application\ Support/Caches
tmutil addexclusion -p ~/Library/Application\ Support/CleanShot
tmutil addexclusion -p ~/Library/Application\ Support/Code\ -\ Insiders
tmutil addexclusion -p ~/Library/Application\ Support/com.sonos.macController
tmutil addexclusion -p ~/Library/Application\ Support/com.sonos.macController2
tmutil addexclusion -p ~/Library/Application\ Support/Dash
tmutil addexclusion -p ~/Library/Application\ Support/discord
tmutil addexclusion -p ~/Library/Application\ Support/Firefox
tmutil addexclusion -p ~/Library/Application\ Support/Google
tmutil addexclusion -p ~/Library/Application\ Support/Imaging\ Edge\ Desktop
tmutil addexclusion -p ~/Library/Application\ Support/InVision\ Studio
tmutil addexclusion -p ~/Library/Application\ Support/JetBrains
tmutil addexclusion -p ~/Library/Application\ Support/Keybase
tmutil addexclusion -p ~/Library/Application\ Support/Knowledge
tmutil addexclusion -p ~/Library/Application\ Support/kotlin
tmutil addexclusion -p ~/Library/Application\ Support/Ledger\ Live
tmutil addexclusion -p ~/Library/Application\ Support/Mozilla
tmutil addexclusion -p ~/Library/Application\ Support/now
tmutil addexclusion -p ~/Library/Application\ Support/nwjs
tmutil addexclusion -p ~/Library/Application\ Support/OpenEmu
tmutil addexclusion -p ~/Library/Application\ Support/org.videolan.vlc
tmutil addexclusion -p ~/Library/Application\ Support/React\ Native\ Debugger
tmutil addexclusion -p ~/Library/Application\ Support/Slack
tmutil addexclusion -p ~/Library/Application\ Support/Sonos
tmutil addexclusion -p ~/Library/Application\ Support/SonosV2
tmutil addexclusion -p ~/Library/Application\ Support/Spotify
tmutil addexclusion -p ~/Library/Application\ Support/zoom.us
tmutil addexclusion -p ~/Library/Caches
tmutil addexclusion -p ~/Library/Containers
tmutil addexclusion -p ~/Library/Detox
tmutil addexclusion -p ~/Library/Developer
tmutil addexclusion -p ~/Library/Group\ Containers
tmutil addexclusion -p ~/Library/Logs
tmutil addexclusion -p ~/Library/Java
tmutil addexclusion -p ~/Library/Mail
tmutil addexclusion -p ~/Library/Messages
tmutil addexclusion -p ~/Library/Metadata
tmutil addexclusion -p ~/Library/Mobile\ Documents
tmutil addexclusion -p ~/Library/Safari
tmutil addexclusion -p ~/Library/SafariTechnologyPreview
tmutil addexclusion -p ~/Library/Screen\ Savers
tmutil addexclusion -p ~/Library/WebKit
tmutil addexclusion -p ~/Movies
tmutil addexclusion -p ~/VirtualBox\ VMs
tmutil addexclusion -p ~/.local/share/mise

tmignore
