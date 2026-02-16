# An example profile
class profile::haproxy {

  include ::haproxy

  haproxy::listen { 'puppet-agent':
    collect_exported => false,
    ipaddress        => $facts['networking']['ip'], # $facts['ec2_metadata']['public-ipv4']
    ports            => [8140],
  }
  haproxy::balancermember { 'compiler01':
    listening_service => 'puppet-agent',
    server_names      => 'ec2-108-130-181-44.eu-west-1.compute.amazonaws.com',
    ipaddresses       => '108.130.181.44',
    ports             => [8140],
    options           => 'check',
  }
  haproxy::balancermember { 'compiler02':
    listening_service => 'puppet-agent',
    server_names      => 'ec2-18-203-244-108.eu-west-1.compute.amazonaws.com',
    ipaddresses       => '18.203.244.108',
    ports             => [8140],
    options           => 'check',
  }
#  haproxy::balancermember { 'compiler03-latency':
#    listening_service => 'puppet-agent',
#    server_names      => 'ec2-18-218-90-197.us-east-2.compute.amazonaws.com',
#    ipaddresses       => '18.218.90.197',
#    ports             => [8140],
#    options           => 'check',
#  }

  haproxy::listen { 'puppet-pxp':
    collect_exported => false,
    ipaddress        => $facts['networking']['ip'], # $facts['ec2_metadata']['public-ipv4']
    ports            => [8142],
  }
  haproxy::balancermember { 'pxp01':
    listening_service => 'puppet-pxp',
    server_names      => 'ec2-108-130-181-44.eu-west-1.compute.amazonaws.com',
    ipaddresses       => '108.130.181.44',
    ports             => [8142],
    options           => 'check',
  }
  haproxy::balancermember { 'pxp02':
    listening_service => 'puppet-pxp',
    server_names      => 'ec2-18-203-244-108.eu-west-1.compute.amazonaws.com',
    ipaddresses       => '18.203.244.108',
    ports             => [8142],
    options           => 'check',
  }
#  haproxy::balancermember { 'pxp03-latency':
#    listening_service => 'puppet-pxp',
#    server_names      => 'ec2-18-218-90-197.us-east-2.compute.amazonaws.com',
#    ipaddresses       => '18.218.90.197',
#    ports             => [8142],
#    options           => 'check',
#  }
}
