class profile::book_puppetdb_centos {
  class { 'puppetdb::server':
    database_host        => 'ec2-52-31-116-165.eu-west-1.compute.amazonaws.com',
    listen_address       => '0.0.0.0',
    open_ssl_listen_port => true,
    open_listen_port     => true,
    command_threads      => 2,
    concurrent_writes    => 4,
  }
}