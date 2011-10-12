# base class for your machines
class base {
    # A better top replacement
    package {"htop":ensure => installed,}
    
    # python
    package {"python-virtualenv":ensure=>installed,}
    package {"python-dev":ensure=>installed,}
    
    # debian packaging tool
    package {"checkinstall":ensure=>installed,}
    
    # included user class from module located at ../modules/users
    include users
    
    # etc ..
}

# A node  with the hostname "rice.pipra.org"
# Put node specific directives here
node 'rice.yourcompany.org' {
    include base
    package {"apache2":ensure => installed,}
    package {"nginx":ensure => installed,}
}

# Here's another machine with hostname "jupiter.yourcompany.org"
node 'jupiter.yourcompany.org' {
    include base
    package {"redis":ensure => installed,}
}
