class profile::book_postgresql_centos {
#  class { 'postgresql::globals':
#    encoding            => 'UTF-8',
#    locale              => 'en_US.UTF-8',
#    version             => '16',
#    manage_package_repo => true,
#    datadir             => '/var/lib/pgsql/16/data',
#    initdb_path         => '/usr/pgsql-16/bin/initdb',
#    service_name        => 'postgresql-16',
#    server_package_name  => 'postgresql16-server-16.11',  # package from yum.postgresql.org (default of postgresql module)
#    contrib_package_name => 'postgresql16-contrib-16.11', # package from yum.postgresql.org (default of postgresql module)
#    psql_path           => '/usr/pgsql-16/bin/psql',
#  }

  class { 'puppetdb::database::postgresql':
    listen_addresses => '0.0.0.0',
    postgres_version => '16',
  }
}
