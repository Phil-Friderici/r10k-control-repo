class profile::base {
  if $facts['os']['name'] != 'CentOS' {
    class { '::ntp': }
  }
}
