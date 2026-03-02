class profile::book_postgresql_centos {
  class { 'puppetdb::database::postgresql':
    listen_addresses => '0.0.0.0',
    postgres_version => '16', # minor version is defined in node declaration in hiera (postgresql::globals::server_package_name & contrib_package_name)
  }

  # set max connections from 100 to 200 to avoid "remaining connection slots are reserved for non-replication superuser connections"
  postgresql::server::config_entry { 'max_connections':
    value => 200,
  }
}
