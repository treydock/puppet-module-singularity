# @summary Private class
# @api private
class singularity::install {
  assert_private()

  if $::osfamily == 'RedHat' {
    if $::singularity::manage_epel {
      include ::epel
      Class['::epel'] -> Package['singularity']
    }
  }

  package { 'singularity':
    ensure => $::singularity::package_ensure,
    name   => $::singularity::package_name,
  }

}
