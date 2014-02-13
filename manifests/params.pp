# Class: screen::params
#
# This class configures parameters for the screen module.
class screen::params {

  case $::osfamily {

    'Debian', 'RedHat', 'SuSE': {
        $screenrc = '/etc/screenrc'
        $owner    = root
        $group    = root
    }

    'windows': {
        $screenrc = 'c:\cygwin\etc\screenrc'
        $owner    = Administrator
        $group    = Users
    }

    default: { fail("This OS Family (${::osfamily}) is not supported") }
  }
}