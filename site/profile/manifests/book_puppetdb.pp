class profile::book_puppetdb {
  class { 'puppetdb::server':
    database_host  => 'ec2-54-170-238-132.eu-west-1.compute.amazonaws.com',
    listen_address => '0.0.0.0',
  }
}
