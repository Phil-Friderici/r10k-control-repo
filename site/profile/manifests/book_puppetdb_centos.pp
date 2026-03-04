class profile::book_puppetdb_centos {
  class { 'puppetdb::server':
    database_host  => 'ec2-79-125-45-224.eu-west-1.compute.amazonaws.com',
    listen_address  => '0.0.0.0',
    open_listen_port => true,
  }
}
