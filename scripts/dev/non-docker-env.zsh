#!/usr/bin/env zsh
#
# Brew and brew cask setup.
source ./scripts/shared/_utils.zsh
source ./scripts/shared/_brew.zsh

ask_for_confirmation "Are you sure you want to install dev env locally using Valet?"

# Install PHP and additional extensions (if not already installed)
# Note: If error occurs with installing from pecl (delete any existing pecl symlinks)
echo
brew install php
print_info "Installing PHP extensions..."
pecl install redis

# Install PHP related things.
# Use Laravel's Valet for local development purposes.
print_info "Installing Laravel installer and Valet..."
composer global require "laravel/installer"
composer global require laravel/valet

echo
print_info "Installed versions..."
laravel --version
valet --version

# Install External Services
echo
print_info "Installing External Services..."
brew install mysql
mysql_secure_installation

brew install mailhog
brew install redis
brew install memcached
brew install sqlite

# Start services (set to run automatically)
echo
print_info "Ensuring services are started..."
brew services start mysql
brew services start mailhog
brew services start redis
brew services start memcached

# Start up valet
echo
print_info "Running Valet install script..."
valet install
valet trust

# Set the working directory for nginx (e.g. /Users/steve/Projects/Sites)
echo
read "directory?Enter the valet working directory: "
if ! [ -d "$directory" ]; then
  mkdir -p "$directory"
fi
cd "$directory"
valet park

# Set Proxy for Mailhog UI to enable easier access
valet proxy mailhog.test http://127.0.0.1:8025

echo
print_info "Checking running brew services..."
brew services list

# Start a service (if stopped for whatever reason)
#     > brew services start mysql
ask_for_confirmation "Do these look good?"
echo

########### Other Valet commands ###########
## Enable HTTPS
#   > valet secure SITE
#   > valet unsecure SITE
## Change PHP version
#  > valet use php@8.0
#  > valet isolate php@8.0 --site="site-name"
## Serve a single ad-hoc site
#  > valet link DIR
#  > valet unlink
## Other commands
#  > valet log
#  > valet forget
#  > valet paths
#  > valet restart
#  > valet start
#  > valet stop
#  > valet trust
#  > valet uninstall --force

# Service entry points commands
# > mysql -u root
# > redis-cli
# > telnet localhost 11211 (memcached) / echo 'flush_all' | nc localhost 11211

echo -e "${GREEN_TICK} Local PHP Dev Env successfully installed.${NC}"
