# See README.md for more details.
class singularity (
  String $package_ensure = 'present',
  String $package_name = $singularity::params::package_name,
  Boolean $manage_epel = true,
  Stdlib::Absolutepath $config_path = $singularity::params::config_path,
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
  Enum['yes','no'] $mount_devpts = 'yes',
  Enum['yes','no'] $mount_home = 'yes',
  Enum['yes','no'] $mount_tmp = 'yes',
  Enum['yes','no'] $mount_hostfs = 'no',
  Array[Stdlib::Absolutepath] $bind_paths = ['/etc/localtime', '/etc/hosts'],
  Enum['yes','no'] $user_bind_control = 'yes',
  Enum['yes','no','try'] $enable_overlay = 'try',
  Enum['yes','no','try'] $enable_underlay = 'no',
  Enum['yes','no'] $mount_slave = 'yes',
  Integer $sessiondir_max_size = 16,
  Optional[Array] $limit_container_owners = undef,
  Optional[Array] $limit_container_groups = undef,
  Optional[Array] $limit_container_paths = undef,
  Hash[String,Enum['yes','no']] $allow_containers = {
    'squashfs' => 'yes',
    'extfs' => 'yes',
    'dir' => 'yes',
  },
  Optional[Array[Stdlib::Absolutepath]] $autofs_bug_paths = undef,
  Enum['yes','no'] $always_use_nv = 'no',
  Enum['full','file','default','no'] $root_default_capabilities = 'no',
  Enum['yes','no'] $allow_root_capabilities = 'yes',
  Enum['yes','no'] $allow_user_capabilities = 'no',
  Enum['tmpfs','ramfs'] $memory_fs_type = 'tmpfs',
  Optional[Stdlib::Absolutepath] $cni_configuration_path = undef,
  Optional[Stdlib::Absolutepath] $cni_plugin_path = undef,
  Optional[Stdlib::Absolutepath] $mksquashfs_path = undef,
) inherits singularity::params {

  contain singularity::install
  contain singularity::config

  Class['singularity::install']
  ->Class['singularity::config']

}
