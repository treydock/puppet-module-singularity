# @summary Manage Singularity plugin
#
# @example install log plugin
#
#   singularity::plugin { 'github.com/sylabs/singularity/log-plugin':
#     source_dir => 'examples/plugins/log-plugin',
#   }
#
# @param source_dir
#   The plugin source directory
#   This path must be relative to Singularity source directory `$singularity::install::source::source_dir`
# @param ensure
#   Whether to install (present) or uninstall (absent) the plugin
# @param sif_name
#   The name of the SIF image to use for install after the plugin is compiled.
#   The default is to use part after last `/` in the plugin name so
#   plugin `examples/plugins/log-plugin` will have SIF name of `log-plugin.sif`.
#
define singularity::plugin (
  Enum['present', 'absent'] $ensure = 'present',
  Optional[String] $source_dir = undef,
  Optional[String] $sif_name = undef,
) {
  include singularity

  if $singularity::install_method != 'source' {
    fail("Define singularity::plugin ${name} can only be done for source installation")
  }

  if $ensure == 'present' and $source_dir =~ Undef {
    fail("Define singularity::plugin ${name} must define source_dir")
  }

  $exec_path = "${singularity::prefix}/bin:${singularity::source_exec_path}"

  if $ensure == 'present' {
    $basename = split($name, '/')[-1]
    $_sif_name = pick($sif_name, "${basename}.sif")
    $sif_path = "${singularity::install::source::source_dir}/${source_dir}/${_sif_name}"

    if $singularity::manage_go and $singularity::rebuild_on_go {
      Class['golang'] ~> Exec["singularity-plugin-recompile-${name}"]
    }

    exec { "singularity-plugin-compile-${name}":
      path        => $exec_path,
      environment => $singularity::install::source::build_env,
      command     => "singularity plugin compile ${source_dir}",
      cwd         => $singularity::install::source::source_dir,
      creates     => $sif_path,
      require     => Class['singularity::install::source'],
    }

    exec { "singularity-plugin-recompile-${name}":
      path        => $exec_path,
      environment => $singularity::install::source::build_env,
      command     => "singularity plugin compile ${source_dir}",
      cwd         => $singularity::install::source::source_dir,
      onlyif      => "test -f ${sif_path}",
      refreshonly => true,
      require     => Class['singularity::install::source'],
      notify      => Exec["singularity-plugin-reinstall-${name}"],
    }

    exec { "singularity-plugin-install-${name}":
      path    => $exec_path,
      command => "singularity plugin install ${sif_path}",
      unless  => "singularity plugin list | grep '${name}'",
      require => Exec["singularity-plugin-compile-${name}"],
    }

    exec { "singularity-plugin-reinstall-${name}":
      path        => $exec_path,
      command     => "singularity plugin install ${sif_path}",
      onlyif      => "singularity plugin list | grep '${name}'",
      refreshonly => true,
      subscribe   => Exec["singularity-plugin-compile-${name}"],
    }

    exec { "singularity-plugin-enable-${name}":
      path    => $exec_path,
      command => "singularity plugin enable ${name}",
      unless  => "singularity plugin list | grep '${name}' | grep yes",
      require => [
        Exec["singularity-plugin-install-${name}"],
        Exec["singularity-plugin-reinstall-${name}"],
      ],
    }
  } else {
    exec { "singularity-plugin-uninstall-${name}":
      path    => $exec_path,
      command => "singularity plugin uninstall ${name}",
      onlyif  => "singularity plugin list | grep '${name}'",
    }
  }

}