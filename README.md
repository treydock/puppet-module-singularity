# puppet-module-singularity

[![Puppet Forge](http://img.shields.io/puppetforge/v/treydock/singularity.svg)](https://forge.puppetlabs.com/treydock/singularity)
[![CI Status](https://github.com/treydock/puppet-module-singularity/workflows/CI/badge.svg?branch=master)](https://github.com/treydock/puppet-module-singularity/actions?query=workflow%3ACI)

#### Table of Contents

1. [Overview](#overview)
2. [Usage - Configuration options](#usage)
3. [Reference - Parameter and detailed reference to all options](#reference)

## Overview

This module manages the singularity installation and configuration of singularity.conf.

RedHat based systems will by default install from EPEL package

Debian based systems will by default install from source

## Usage

### singularity

Install and configure singularity.

```puppet
include singularity
```

The following Hiera example of building from source (default for Debian based systems) with several additional options passed.

```yaml
singularity::install_method: source
singularity::build_flags:
  without-suid: true
  mandir: /some/other/path
singularity::build_env:
  GOPATH=/some/other/path
singularity::prefix: /opt/singularity
singularity::sysconfdir: /opt/singularity/etc
singularity::localstatedir: /opt/singularity/var
```

Compile and install a Singularity plugin from the Singularity source:

```yaml
singularity::plugins:
  github.com/sylabs/singularity/log-plugin:
    source_dir: examples/plugins/log-plugin
```

## Reference

[http://treydock.github.io/puppet-module-singularity/](http://treydock.github.io/puppet-module-singularity/)

