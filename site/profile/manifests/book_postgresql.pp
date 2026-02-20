class profile::book_postgresql {
  class { 'postgresql::globals':
    encoding            => 'UTF-8',
    locale              => 'en_US.UTF-8',
    version             => '15',
    manage_package_repo => true,
  }
  class { 'postgresql::server':
    listen_addresses => '127.0.0.1',
  }
  postgresql::server::extension { 'pg_trgm':
    database => 'puppetdb',
    require  => Postgresql::Server::Db['puppetdb'],
    before   => Service['puppetdb'],
  }
}
