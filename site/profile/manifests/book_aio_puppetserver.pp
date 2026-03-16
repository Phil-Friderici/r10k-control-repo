class profile::book_aio_puppetserver {
  class { 'puppet':
    server                => true,
    server_foreman        => false,
    server_reports        => 'puppetdb,store',
    server_storeconfigs   => true,
    server_external_nodes => '',
  }

  include puppetdb
  class { 'puppet::server::puppetdb':
    server => 'ec2-54-170-24-140.eu-west-1.compute.amazonaws.com', # PuppetDB runs on Puppetmaster itself
  }
}