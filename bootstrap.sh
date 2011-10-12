#!/bin/sh -e -x
echo "=> begin provisioning software"
apt-get update
apt-get -y upgrade
apt-get -y autoremove
sudo apt-get install -y libopenssl-ruby ruby ruby-dev rubygems


# install puppet
echo "=> setting up puppet"
gem install --no-ri --no-rdoc puppet

# make sure there's a puppet user
useradd puppet

# add ruby gems bin path
echo "export PATH=$PATH:/var/lib/gems/1.8/bin" > /etc/profile.d/rubygems1.8.sh && . /etc/profile.d/rubygems1.8.sh

# run puppet
echo "=> running puppet"
export PUPPETLIB=/etc/puppet/modules
puppet apply /etc/puppet/manifests/site.pp

echo "=> puppet finished; "
exit 0



