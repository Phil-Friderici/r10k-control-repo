class profile::book_postgresql_centos {
  class { 'postgresql::globals':
    encoding            => 'UTF-8',
    locale              => 'en_US.UTF-8',
    version             => '16',
    manage_package_repo => true,
    datadir             => '/var/lib/pgsql/16/data',
    initdb_path         => '/usr/pgsql-16/bin/initdb',
    service_name        => 'postgresql-16',
    server_package_name => 'postgresql16-server', # package from pgdg16 https://www.hostinger.com/tutorials/how-to-install-postgresql-on-centos
    psql_path           => '/usr/pgsql-16/bin/psql',
  }
  class { 'postgresql::server':
    listen_addresses        => '172.31.25.101',
    ip_mask_allow_all_users => '0.0.0.0/0',
  }

  class { 'puppetdb::database::postgresql':
    manage_server    => false,
    listen_addresses => '172.31.25.101',
  }

  # set from 100 to 200 to avoid "remaining connection slots are reserved for non-replication superuser connections"
  postgresql::server::config_entry { 'max_connections':
    value => 200,
  }

  postgresql::server::extension { 'pg_trgm':
    database => 'puppetdb',
    require  => Postgresql::Server::Db['puppetdb'],
#    before   => Service['puppetdb'], # PuppetDB runs on other node
  }
}
