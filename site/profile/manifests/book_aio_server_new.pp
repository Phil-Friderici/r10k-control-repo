class profile::book_aio_server_new {
   $auth_allowlist = [
                       'localhost',
                       'ec2-18-203-153-206.eu-west-1.compute.amazonaws.com',
                       'ec2-34-244-189-61.eu-west-1.compute.amazonaws.com',
                       downcase($facts['networking']['fqdn']),
                     ]

  class { 'puppet':
    server                     => true,
    server_foreman             => false,
    server_reports             => 'puppetdb,store',
    server_storeconfigs        => true,
    server_external_nodes      => '',
    autosign_entries           => ['*.load.client'],
    agent_additional_settings  => {server => puppet},
    server_additional_settings => {storeconfigs_backend => 'puppetdb'},
    ca_server                  => 'ec2-52-19-50-6.eu-west-1.compute.amazonaws.com',
    server_ca                  => false,
    server_ca_client_allowlist => $auth_allowlist,
    server_admin_api_allowlist => $auth_allowlist,
  }

  class { 'puppetdb':
    database_host        => 'ec2-52-211-193-160.eu-west-1.compute.amazonaws.com',
    manage_firewall      => false,
    listen_address       => '0.0.0.0',
    open_ssl_listen_port => true,
    open_listen_port     => true,
    command_threads      => 2,
    concurrent_writes    => 4,
  }

  class { 'puppetdb::master::config':
    puppetdb_server     => $facts['networking']['fqdn'],
    manage_storeconfigs => false,
  }
}
