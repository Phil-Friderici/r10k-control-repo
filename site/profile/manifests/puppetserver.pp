class profile::puppetserver {
  class { 'puppetdb::master::config':
    puppetdb_server => 'ec2-3-254-122-1.eu-west-1.compute.amazonaws.com',
  }
}
