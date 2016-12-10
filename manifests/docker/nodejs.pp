class profiles::docker::nodejs(
  $deploy_dir,
  $git_repo,
  $git_revision,
  $service_run_command,
  $service_name,
  $node_version,
  $node_group,
  $node_user,
) {

  group { $node_group:
    ensure => present,
  } ->

  user { $node_user:
    ensure => present,
    shell  => '/bin/false',
    gid    => $group,
  }

  limits::entry { 'ulimits-nofile':
    domain => "*",
    type   => '-',
    item   => 'nofile',
    value  => '500000',
    require => User[$node_user],
  }

  vcsrepo { $deploy_dir:
    ensure   => present,
    provider => git,
    source   => $git_repo,
    revision => $git_revision,
    require => User[$node_user],
  }
}
