class profile::book_aio_server {
  class { 'puppet':
    server                     => true,
    ca_server                  => 'ec2-108-130-189-34.eu-west-1.compute.amazonaws.com',
    server_ca                  => false,
    server_foreman             => false,
    server_reports             => 'puppetdb,store',
    server_storeconfigs        => true,
    server_external_nodes      => '',
    agent_additional_settings  => {server => puppet},
    server_additional_settings => {storeconfigs_backend => 'puppetdb'},
  }

  class { 'puppetdb::master::config':
    puppetdb_server     => $facts['networking']['fqdn'],
    manage_storeconfigs => false,
  }

  class { 'puppetdb::server':
    database_host        => 'ec2-52-211-193-160.eu-west-1.compute.amazonaws.com',
    manage_firewall      => false,
    listen_address       => '0.0.0.0',
    open_ssl_listen_port => true,
    open_listen_port     => true,
    command_threads      => 2,
    concurrent_writes    => 4,
  }
}
