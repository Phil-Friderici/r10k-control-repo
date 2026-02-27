class profile::book_puppetdb {
  class { 'puppetdb::server':
    database_host  => 'ec2-34-244-198-2.eu-west-1.compute.amazonaws.com',
    listen_address => '0.0.0.0',
  }
}
