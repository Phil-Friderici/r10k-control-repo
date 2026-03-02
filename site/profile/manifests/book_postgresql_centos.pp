class profile::book_postgresql_centos {
  class { 'puppetdb::database::postgresql':
    listen_addresses => '0.0.0.0',
    postgres_version => '16', # minor version is defined in node declaration in hiera (postgresql::globals::server_package_name & contrib_package_name)
  }
}
