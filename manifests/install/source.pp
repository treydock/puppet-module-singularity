# @summary Private class
# @api private
class singularity::install::source {
  assert_private()

  if $singularity::manage_go {
    include golang
    Class['golang'] -> Exec['singularity-mconfig']
  }
  ensure_packages($singularity::source_dependencies, {'before' => Exec['singularity-mconfig']})

  $source_dir = "${singularity::source_base_dir}/singularity-${singularity::version}"
  $base_build_flags = {
    'prefix' => $singularity::prefix,
    'localstatedir' => $singularity::localstatedir,
    'sysconfdir' => $singularity::sysconfdir,
  }
  $build_flags_mapped = ($base_build_flags + $singularity::build_flags).map |$key, $value| {
    if $value == '' or $value =~ Boolean {
      "--${key}"
    } else {
      "--${key}=${value}"
    }
  }
  $build_flags = join($build_flags_mapped, ' ')
  $base_build_env = {
    'HOME' => '/root',
  }
  $build_env = ($base_build_env + $singularity::build_env).map |$key, $value| { "${key}=${value}" }
  file { $source_dir:
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }
  -> archive { "/tmp/singularity-${singularity::version}.tar.gz":
      source          => "https://github.com/hpcng/singularity/releases/download/v${singularity::version}/singularity-${singularity::version}.tar.gz",
      extract         => true,
      extract_path    => $source_dir,
      extract_command => 'tar xfz %s --strip-components=1',
      creates         => "${source_dir}/mconfig",
      cleanup         => true,
      user            => 'root',
      group           => 'root',
    }
  -> file { 'singularity-mconfig':
    ensure  => 'file',
    path    => "${source_dir}/mconfig.sh",
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => join([
      '#!/bin/bash',
      '# File managed by Puppet, do not edit',
      "./mconfig ${build_flags}",
      '',
    ], "\n")
  }
  ~> exec { 'singularity-mconfig':
    path        => $singularity::source_exec_path,
    environment => $build_env,
    command     => "${source_dir}/mconfig.sh",
    cwd         => $source_dir,
    refreshonly => true,
  }
  ~> exec { 'singularity-make':
    path        => $singularity::source_exec_path,
    environment => $build_env,
    command     => 'make -C ./builddir',
    cwd         => $source_dir,
    refreshonly => true,
  }
  ~> exec { 'singularity-make-install':
    path        => $singularity::source_exec_path,
    environment => $build_env,
    command     => 'make -C ./builddir install',
    cwd         => $source_dir,
    refreshonly => true,
  }
}
