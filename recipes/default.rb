#
# Cookbook:: wordpress
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

####
# Adding Basic Repositories required
####
include_recipe 'LEMP-Centos::nginx'
include_recipe 'LEMP-Centos::php-fpm'
include_recipe 'LEMP-Centos::mysql'
include_recipe 'LEMP-Centos::source'
