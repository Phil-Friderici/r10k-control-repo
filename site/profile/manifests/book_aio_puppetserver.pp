class profile::book_aio_puppetserver {
  class { 'puppet':
    server                => true,
    server_foreman        => false,
    server_reports        => 'puppetdb,store',
    server_storeconfigs   => true,
    server_external_nodes => '',
    autosign_entries      => ['*.load.client']
  }

  class { 'puppetdb':
    manage_firewall => false,
  }

  class { 'puppet::server::puppetdb':
    server => 'ec2-108-130-189-34.eu-west-1.compute.amazonaws.com', # PuppetDB runs on Puppetmaster itself
  }
}