# Private class.
class singularity::params {

  case $::osfamily {
    'RedHat': {
      $package_name       = 'singularity'
      $config_path        = '/etc/singularity/singularity.conf'

      if versioncmp($::operatingsystemrelease, '7.2') >= 0 {
        $enable_overlay = 'yes'
      } else {
        $enable_overlay = 'no'
      }
    }

    default: {
      fail("Unsupported osfamily: ${::osfamily}, module ${module_name} only support osfamily RedHat")
    }
  }

}
