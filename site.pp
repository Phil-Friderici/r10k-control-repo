hiera_include('classes')

if $facts['networking']['domain'] == 'example.com' {
  include 'profile::base'
}
