# Private class.
class singularity::config {
  assert_private()

  file { 'singularity.conf':
    ensure  => 'file',
    path    => $::singularity::config_path,
    content => template($::singularity::config_template),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

}
