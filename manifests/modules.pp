/*
What ever you import or define in this file will be globally visible to all your 
other modules. 

Add in any commonly used defines here, but try to minimize the use of this file because
you want the puppet modules to be as independent as possible from one another

# This is a small set of commonly used functions for puppet . You can get 
# the source code here: https://github.com/puppet-modules/puppet-common
import common
*/

define wget::fetch($source,$destination) {
	if $http_proxy {
		exec { "wget-$name":
			command => "/usr/bin/wget --output-document=$destination $source",
			creates => "$destination",
			environment => [ "HTTP_PROXY=$http_proxy", "http_proxy=$http_proxy" ],
			require => Package['wget']
		}
    } else {
		exec { "wget-$name":
			command => "/usr/bin/wget --output-document=$destination $source",
			creates => "$destination",
			require => Package['wget']
		}
	}
}





