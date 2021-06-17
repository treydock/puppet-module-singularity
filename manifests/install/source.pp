# @summary Private class
# @api private
class singularity::install::source {
  assert_private()

  if $singularity::manage_go {
    include golang
    if $singularity::rebuild_on_go {
      Class['golang'] ~> Exec['singularity-mconfig']
    } else {
      Class['golang'] -> Exec['singularity-mconfig']
    }
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

  file { 'singularity-mconfig':
      ensure  => 'file',
      path    => $singularity::source_mconfig_path,
      owner   => 'root',
      group   => 'root',
      mode    => '0755',
      content => join([
        '#!/bin/bash',
        '# File managed by Puppet, do not edit',
        "cd ${source_dir}",
        "./mconfig ${build_flags}",
        '',
      ], "\n")
    }

  file { $source_dir:
    ensure => 'directory',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }
  -> archive { 'singularity-source':
      path            => "/tmp/singularity-${singularity::version}.tar.gz",
      source          => "https://github.com/hpcng/singularity/releases/download/v${singularity::version}/singularity-${singularity::version}.tar.gz",
      extract         => true,
      extract_path    => $source_dir,
      extract_command => 'tar xfz %s --strip-components=1',
      creates         => "${source_dir}/mconfig",
      cleanup         => true,
      user            => 'root',
      group           => 'root',
      notify          => Exec['singularity-mconfig'],
    }
  exec { 'singularity-mconfig':
    path        => $singularity::source_exec_path,
    environment => $build_env,
    command     => $singularity::source_mconfig_path,
    cwd         => $source_dir,
    refreshonly => true,
    subscribe   => File['singularity-mconfig'],
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
