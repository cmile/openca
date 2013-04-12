#! /bin/bash

apt-get -y update
apt-get -y upgrade
apt-get -y install aptitude build-essential libssl-dev apache2 libldap2-dev perl mc vim mysql-server libdbi-perl libnet-ssleay-perl libnet-ldap-perl libx500-dn-perl libmime-perl libmime-tools-perl libnet-server-perl libdigest-sha-perl libencode-locale-perl

a2enmod ssl
a2ensite default-ssl
/etc/init.d/apache2 restart

echo "Installing required Perl modules: SKIP"

# DBI missing
#perl -MCPAN -e "install Net::LDAP; install Net::SSLeay; install X500::DN; install MIME::Parser; install Net::Server::Fork; install MIME::Lite; install Digest::SHA1; install Locale::Messages "

#perl -MCPAN -e "install MIME::Parser; install Net::Server::Fork; install MIME::Lite; install Locale::Messages "

echo "Now create a user for OpenCA in the database:"
echo "create user 'openca'@'localhost' identified by 'openca'; create database openca; grant all privileges on openca.* to 'openca'@'localhost';"

