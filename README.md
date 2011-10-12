Setup
=====

On the machine you want to configure
    
    hostname 'rice.yourcompany.org' 
    
    mkdir /etc/puppet
    cd /etc/puppet
    git clone https://github.com/huyng/puppet_starter_kit.git .
    
    bash bootstrap.sh


Running the puppet configuration again
======================================

Add this this function to your `/etc/profile`

    function puppetapply {
        export PUPPETLIB=/etc/puppet/modules
        puppet apply /etc/puppet/manifests/site.pp
    }

Now whenever you've made changes to `/etc/puppet`  you can re-run puppet by running `puppetapply`


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
    

