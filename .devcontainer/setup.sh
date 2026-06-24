#!/bin/bash

# Install Composer 2.5.5 (exact version like your lab)
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php --version=2.5.5
sudo mv composer.phar /usr/local/bin/composer
php -r "unlink('composer-setup.php');"

# Install PHP extensions Laravel needs
sudo apt-get update
sudo apt-get install -y php8.2-mbstring php8.2-xml php8.2-curl php8.2-zip php8.2-mysql

# Install Laravel dependencies if composer.json exists
if [ -f "composer.json" ]; then
  composer install
fi

# Copy .env if not present
if [ ! -f ".env" ]; then
  cp .env.example .env
  php artisan key:generate
fi
