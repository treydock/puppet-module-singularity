# puppet-module-singularity

[![Puppet Forge](http://img.shields.io/puppetforge/v/treydock/singularity.svg)](https://forge.puppetlabs.com/treydock/singularity)
[![Build Status](https://travis-ci.org/treydock/puppet-module-singularity.png)](https://travis-ci.org/treydock/puppet-module-singularity)

####Table of Contents

1. [Overview](#overview)
2. [Usage - Configuration options](#usage)
3. [Reference - Parameter and detailed reference to all options](#reference)
4. [Limitations - OS compatibility, etc.](#limitations)
5. [Development - Guide for contributing to the module](#development)
6. [TODO](#todo)
7. [Additional Information](#additional-information)

## Overview

This module manages the singularity package installation and configuration of singularity.conf.

## Usage

### singularity

Install and configure singularity:

    class { 'singularity': }

## Reference

### Classes

#### Public classes

* `singularity`: Installs and configures singularity.

#### Private classes

* `singularity::install`: Installs singularity packages.
* `singularity::config`: Configures singularity.
* `singularity::params`: Sets parameter defaults based on fact values.

### Parameters

#### singularity

Below are parameter defaults in Hiera format:

    singularity::package_ensure: present
    singularity::package_name: singularity
    singularity::manage_epel: true
    singularity::config_path: /etc/singularity/singularity.conf
    singularity::config_template: singularity/singularity.conf.erb
    singularity::allow_setuid: yes
    singularity::max_loop_devices: 256
    singularity::allow_pid_ns: yes
    singularity::config_passwd: yes
    singularity::config_group: yes
    singularity::config_resolv_conf: yes
    singularity::mount_proc: yes
    singularity::mount_sys: yes
    singularity::mount_dev: yes
    singularity::mount_home: yes
    singularity::mount_tmp: yes
    singularity::mount_hostfs: no
    singularity::bind_paths:
      - /etc/localtime
      - /etc/hosts
    singularity::user_bind_control: yes
    singularity::enable_overlay: yes
    singularity::mount_slave: yes
    singularity::sessiondir_max_size: 16
    #singularity::limit_container_owners: undef
    #singularity::limit_container_paths: undef

#####`package_ensure`
Package ensure parameter, defaults to `present`

#####`package_name`
Package name, defaults to `singularity`

#####`manage_epel`
Determines whether to include EPEL class before installing singularity.  Defaults to `true`


## Limitations

This module has been tested on:

* CentOS 6 x86_64
* CentOS 7 x86_64

## Development

### Testing

Testing requires the following dependencies:

* rake
* bundler

Install gem dependencies

    bundle install

Run unit tests

    bundle exec rake test

If you have Vagrant >= 1.2.0 installed you can run system tests

    bundle exec rake beaker

## TODO

## Further Information

*
