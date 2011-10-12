define sshuser (
    $name, 
    $gid, 
    $groups,
    $ssh_public_key,
    $ssh_key_name = "${name}-ssh-key",
    $ssh_key_type = 'rsa'
) {
    
    group {"${name}":
        name   => "${name}",
        ensure => 'present'
    }
    
    user { "${name}": 
       ensure => 'present', 
       groups => $groups, 
       gid => "${gid}",
       comment => 'This user was created by Puppet', 
       provider => 'useradd',
       managehome => 'true', 
       shell => '/bin/bash',
       require => Group["${name}"],
    } 

    file { "/home/${name}/.ssh": 
        ensure => 'directory', 
        require => User["${name}"], 
        owner => "${name}", 
        mode => '700', 
    } 

    ssh_authorized_key { "${ssh_key_name}": 
       ensure => 'present', 
       key => "${ssh_public_key}", 
       type => "${ssh_key_type}", 
       user => "${name}", 
       require => File["/home/${name}/.ssh"], 
    }
    
}
