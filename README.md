Setup
=====
    
    mkdir /etc/puppet
    cd /etc/puppet
    git 

Instructions for allocating new machines
========================================

Add a new "node" entry into manifests/nodes.pp. Here's an example:

    node '<YOUR NODE NAME>' {

        include redis
        include supervisord
        include nginx
        include apache
        
        # include more modules here ...
        
    }
    

