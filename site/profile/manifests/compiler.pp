class profile::compiler {

  class { 'puppet':
    server                => true,
    server_foreman        => false,
    server_reports        => 'puppetdb,store',
    server_storeconfigs   => true,
    server_external_nodes => '',
    # use Puppetmaster as CA
    server_ca             => false,
    ca_server             => 'ec2-3-254-160-41.eu-west-1.compute.amazonaws.com', # CA runs on Puppetmaster
  }

  class { 'puppet::server::puppetdb':
    server => 'ec2-3-254-160-41.eu-west-1.compute.amazonaws.com', # PuppetDB runs on Puppetmaster
  }
}
