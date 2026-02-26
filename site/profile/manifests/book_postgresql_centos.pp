class profile::book_postgresql_centos {
  class { 'postgresql::globals':
    encoding            => 'UTF-8',
    locale              => 'en_US.UTF-8',
    version             => '16',
    manage_package_repo => true,
    datadir             => '/var/lib/pgsql/data',
    initdb_path         => '/bin/initdb',
    service_name        => 'postgresql',
    server_package_name => 'postgresql-server', # package from appstream https://bckinfo.com/how-to-install-postgresql-16-3-on-centos-stream-9/
    psql_path           => '/bin/psql',
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
