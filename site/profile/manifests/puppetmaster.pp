class profile::puppetmaster {
  class { 'puppet':
    server                => true,
    server_foreman        => false,
    server_reports        => 'puppetdb,store',
    server_storeconfigs   => true,
    server_external_nodes => '',
  }

  include puppetdb
  class { 'puppet::server::puppetdb':
    server => 'ec2-3-254-160-41.eu-west-1.compute.amazonaws.com', # PuppetDB runs on Puppetmaster itself
#    server => 'ec2-3-250-185-137.eu-west-1.compute.amazonaws.com', # PuppetDB runs on pf-book-puppetdb1
  }
}
