class profile::book_puppetdb {
  class { 'puppetdb::server':
    database_host => 'ec2-3-249-73-230.eu-west-1.compute.amazonaws.com',
  }
}
