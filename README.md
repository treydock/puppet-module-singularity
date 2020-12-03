# puppet-module-singularity

[![Puppet Forge](http://img.shields.io/puppetforge/v/treydock/singularity.svg)](https://forge.puppetlabs.com/treydock/singularity)
[![CI Status](https://github.com/treydock/puppet-module-singularity/workflows/CI/badge.svg?branch=master)](https://github.com/treydock/puppet-module-singularity/actions?query=workflow%3ACI)

#### Table of Contents

1. [Overview](#overview)
2. [Usage - Configuration options](#usage)
3. [Reference - Parameter and detailed reference to all options](#reference)
4. [Limitations - OS compatibility, etc.](#limitations)
5. [Development - Guide for contributing to the module](#development)
6. [TODO](#todo)
7. [Additional Information](#additional-information)

## Overview

This module manages the singularity package installation and configuration of singularity.conf.

**NOTE:** The `puppetlabs/yumrepo_core` Puppet module is a soft dependency if using Puppet >= 6.0.0.

## Usage

### singularity

Install and configure singularity:

    class { 'singularity': }

## Reference

[http://treydock.github.io/puppet-module-singularity/](http://treydock.github.io/puppet-module-singularity/)

## Limitations

This module has been tested on:

* RedHat/CentOS 6 x86_64
* RedHat/CentOS 7 x86_64
* RedHat/CentOS 8 x86_64

## Development

### Testing

Testing requires the following dependencies:

* rake
* bundler

Install gem dependencies

    bundle install

Run unit tests

    bundle exec rake spec

If you have Vagrant >= 1.2.0 installed you can run system tests

    bundle exec rake beaker
