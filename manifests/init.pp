# @summary Manage Singularity
#
# @example
#   include ::singularity
#
# @param package_ensure
#   Package ensure property
# @param package_name
#   Singularity package name
# @param manage_epel
#   Determines if EPEL repo should be managed
# @param config_path
#   Path to singularity.conf
# @param config_template
#   Template used for singularity.conf
# @param allow_setuid
#   See singularity.conf: `allow setuid`
# @param max_loop_devices
#   See singularity.conf: `max loop devices`
# @param allow_pid_ns
#   See singularity.conf: `allow pid ns`
# @param config_passwd
#   See singularity.conf: `config passwd`
# @param config_group
#   See singularity.conf: `config group`
# @param config_resolv_conf
#   See singularity.conf: `config resolv conf`
# @param mount_proc
#   See singularity.conf: `mount proc`
# @param mount_sys
#   See singularity.conf: `mount sys`
# @param mount_dev
#   See singularity.conf: `mount dev`
# @param mount_devpts
#   See singularity.conf: `mount devpts`
# @param mount_home
#   See singularity.conf: `mount home`
# @param mount_tmp
#   See singularity.conf: `mount tmp`
# @param mount_hostfs
#   See singularity.conf: `mount hostfs`
# @param bind_paths
#   See singularity.conf: `bind paths`
# @param user_bind_control
#   See singularity.conf: `user bind control`
# @param enable_fusemount
#   See singularity.conf: `enable fusemount`
# @param enable_overlay
#   See singularity.conf: `enable overlay`
# @param enable_underlay
#   See singularity.conf: `enable underlay`
# @param mount_slave
#   See singularity.conf: `mount slave`
# @param sessiondir_max_size
#   See singularity.conf: `sessiondir max size`
# @param limit_container_owners
#   See singularity.conf: `limit container owners`
# @param limit_container_groups
#   See singularity.conf: `limit container groups`
# @param limit_container_paths
#   See singularity.conf: `limit container paths`
# @param allow_containers
#   See singularity.conf: `allow containers`
# @param autofs_bug_paths
#   See singularity.conf: `autofs bug paths`
# @param always_use_nv
#   See singularity.conf: `always use nv`
# @param always_use_rocm
#   See singularity.conf: `always use rocm`
# @param root_default_capabilities
#   See singularity.conf: `root default capabilities`
# @param memory_fs_type
#   See singularity.conf: `memory fs type`
# @param cni_configuration_path
#   See singularity.conf: `cni configuration path`
# @param cni_plugin_path
#   See singularity.conf: `cni plugin path`
# @param mksquashfs_path
#   See singularity.conf: `mksquashfs path`
# @param cryptsetup_path
#   See singularity.conf: `cryptsetup path`
# @param shared_loop_devices
#   See singularity.conf: `shared loop devices`
# @param namespace_users
#   List of uses to add to /etc/subuid and /etc/subgid to support user namespaces
# @param namespace_begin_id
#  The beginning ID for /etc/subuid and /etc/subgid. The value is incremented
#  For each user by start + namespace_id_range + 1
# @param namespace_id_range
#   The range of UIDs/GIDs usable by a user in namespaces
# @param subid_template
#   The template to use for /etc/subuid and /etc/subgid
#
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
  Enum['yes','no'] $enable_fusemount = 'yes',
  Enum['yes','no','try'] $enable_overlay = 'try',
  Enum['yes','no','try'] $enable_underlay = 'yes',
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
  Enum['yes','no'] $always_use_rocm = 'no',
  Enum['full','file','default','no'] $root_default_capabilities = 'full',
  Enum['tmpfs','ramfs'] $memory_fs_type = 'tmpfs',
  Optional[Stdlib::Absolutepath] $cni_configuration_path = undef,
  Optional[Stdlib::Absolutepath] $cni_plugin_path = undef,
  Optional[Stdlib::Absolutepath] $mksquashfs_path = undef,
  Optional[Stdlib::Absolutepath] $cryptsetup_path = undef,
  Enum['yes','no'] $shared_loop_devices = 'no',
  Array $namespace_users = [],
  Integer $namespace_begin_id = 65537,
  Integer $namespace_id_range = 65536,
  String $subid_template = 'singularity/subid.erb',
) {

  if ! $facts['os']['family'] in ['RedHat'] {
    fail("Unsupported osfamily: ${facts['os']['family']}, module ${module_name} only support osfamily RedHat")
  }

  contain singularity::install
  contain singularity::config

  Class['singularity::install']
  ->Class['singularity::config']

}
