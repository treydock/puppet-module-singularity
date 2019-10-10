# @summary Private class
# @api private
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

  if ! empty($::singularity::namespace_users) {
    file { '/etc/subuid':
      ensure  => 'file',
      content => template($::singularity::subid_template),
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
    }
    file { '/etc/subgid':
      ensure  => 'file',
      content => template($::singularity::subid_template),
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
    }
  }

}
