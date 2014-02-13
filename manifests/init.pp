# Class to install and configure screen
class screen {  
    # Include OS specific configuration items
    include screen::params
    
    # Only install the package if we are not on Windows
    if $::osfamily != "windows" {
	    package { 'screen':
	      ensure => present,
	      before => File["$screen::params::screenrc"],
        }
    }

    file { 
        $screen::params::screenrc:
            ensure => 'file',
            mode   => '0644',
		    owner  => $screen::params::owner,
		    group  => $screen::params::group,
		    source => 'puppet:///modules/screen/screenrc';
    }
}




