class profile::book_postgresql {
  class { 'postgresql::globals':
    encoding            => 'UTF-8',
    locale              => 'en_US.UTF-8',
    version             => '15',
    manage_package_repo => true,
  }
  class { 'postgresql::server':
    listen_addresses        => '172.31.31.135',
    ip_mask_allow_all_users => '0.0.0.0/0',
  }

  class { 'puppetdb::database::postgresql':
    manage_server    => false,
    listen_addresses => '172.31.31.135',
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
