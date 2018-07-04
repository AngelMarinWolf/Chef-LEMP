####
# Defining default PHP properties
####
default['php']['extensions'] = %w{
  php-gd
  php-mbstring
  php-mcrypt
  php-pear
  php-mysql
  php-pdo
  php-cli
  php-imap
  php-pspell
  php-xml*
  gettext
}

default['php']['bind_address']  = "0.0.0.0"
default['php']['host']          = "127.0.0.1"
default['php']['port']          = 9000

node['php']['listen_owner']     = "nginx"
node['php']['listen_group']     = "nginx"
node['php']['listen_mode']      = "0644"

node['php']['user']             = "nginx"
node['php']['group']            = "nginx"
