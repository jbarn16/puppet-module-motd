# == Class: motd
#
# Full description of class motd here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'motd':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
# == Class: motd
#
#Module to manage motd
#
class motd (
)  {
  case $::role {
    'puppetmaster': {
      $banner = "should you really be logged in here?\n\n"
    }
    'webserver': {
      $banner = "Welcome to $[::fqdn}. This is a webserver.\n\n"
    }
    default: {
      fail ("Role is <${::role}>. Module supports  role of puppermaster")
    }
  }

    file { '/etc/motd':
      ensure  => file,
      #source => 'puppet:///modules/motd/motd',
      content =>  $banner,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
   }
}
