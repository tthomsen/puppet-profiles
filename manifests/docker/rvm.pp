class profiles::docker::rvm(
   $rvm_version,
   $system_users = [],
) {

  class { '::rvm':
    system_users => $system_users,
  }

  rvm_system_ruby {
    $rvm_version:
      ensure      => 'present',
      default_use => true,
  }
}
