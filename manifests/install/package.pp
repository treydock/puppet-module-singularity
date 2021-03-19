# @summary Private class
# @api private
class singularity::install::package {
  assert_private()

  if $facts['os']['family'] == 'RedHat' and $singularity::manage_epel {
    include epel
    Class['epel'] -> Package['singularity']
  }

  package { 'singularity':
    ensure => $::singularity::package_ensure,
    name   => $::singularity::package_name,
  }
}
