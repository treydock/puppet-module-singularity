# See README.md for more details.
class singularity (
  String $package_ensure = 'present',
  String $package_name = $singularity::params::package_name,
  Boolean $manage_epel = true,
  String $config_path = $singularity::params::config_path,
  String $config_template = 'singularity/singularity.conf.erb',
  Enum['yes','no'] $allow_setuid  = 'yes',
  Integer $max_loop_devices = 256,
  Enum['yes','no'] $allow_pid_ns = 'yes',
  Enum['yes','no'] $config_passwd = 'yes',
  Enum['yes','no'] $config_group = 'yes',
  Enum['yes','no'] $config_resolv_conf = 'yes',
  Enum['yes','no'] $mount_proc = 'yes',
  Enum['yes','no'] $mount_sys = 'yes',
  Enum['yes','no'] $mount_dev = 'yes',
  Enum['yes','no'] $mount_home = 'yes',
  Enum['yes','no'] $mount_tmp = 'yes',
  Enum['yes','no'] $mount_hostfs = 'no',
  Array $bind_paths = ['/etc/localtime', '/etc/hosts'],
  Enum['yes','no'] $user_bind_control = 'yes',
  Enum['yes','no'] $enable_overlay = 'yes',
  Enum['yes','no'] $mount_slave = 'yes',
  Integer $sessiondir_max_size = 16,
  Optional[Array] $limit_container_owners = undef,
  Optional[Array] $limit_container_paths = undef,
) inherits singularity::params {

  contain singularity::install
  contain singularity::config

  Class['singularity::install']
  ->Class['singularity::config']

}
