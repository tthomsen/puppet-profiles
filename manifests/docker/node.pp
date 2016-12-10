class profiles::docker::nodejs(
  $deploy_dir,
  $git_repo,
  $git_revision,
  $service_run_command,
  $service_name,
  $node_version,
) {

  group { $group:
    ensure => present,
  } ->

  user { $user:
    ensure => present,
    shell  => '/bin/false',
    gid    => $group,
  }

  limits::entry { 'ulimits-nofile':
    domain => "*",
    type   => '-',
    item   => 'nofile',
    value  => '500000',
    require => User[$user],
  }

  vcsrepo { $deploy_dir:
    ensure   => present,
    provider => git,
    source   => $git_repo,
    revision => $git_revision,
    require => User[$user],
  }

  class { 'nodejs':
  repo_url_suffix => $node_version,
}
}
