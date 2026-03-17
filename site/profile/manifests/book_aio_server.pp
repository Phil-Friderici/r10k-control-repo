class profile::book_aio_server {
  class { 'puppet':
    server                => true,
    server_foreman        => false,
    server_reports        => 'puppetdb,store',
    server_storeconfigs   => true,
    server_external_nodes => '',
  }

  class { 'puppetdb':
    manage_firewall => false,
  }

  class { 'puppet::server::puppetdb':
    server => '127.0.0.1', # PuppetDB runs locally
  }
}