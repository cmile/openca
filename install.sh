#! /bin/bash

pushd openca-tools-1.3.0
./configure
make
make install
popd

if [ -f /etc/init.d/openca ]; then
   /etc/init.d/openca stop
fi

export PERL_MM_OPT=

pushd openca-base-1.1.1

./configure --with-cgi-fs-prefix=/usr/lib/cgi-bin/pki --with-htdocs-fs-prefix=/var/www/pki --prefix=/opt/openca --with-httpd-main-dir=pki --with-auth-user="openca" --with-auth-password="foo" --prefix="/opt/openca"

make clean
make

# Die CA installieren
make install-offline

# Ganz böse die RA gleich hinterher
make install-online

ln -s /opt/openca/etc/openca /etc/openca
ln -s /opt/openca/etc/init.d/openca /etc/init.d/openca

# bug fixing...
cp /home/user/Downloads/initServer /opt/openca/lib/openca/functions/initServer
cp /home/user/Downloads/User.pm /opt/openca/lib/openca/perl_modules/perl5/OpenCA/User.pm

# jetzt wird es zeit die config zu editieren
vi /etc/openca/config.xml

# die config in die templates propagieren
/etc/openca/configure_etc.sh

rm /opt/openca/var/openca/log/*; 
chown www-data: -R /opt/openca/var/openca 

# OpenCA starten
/etc/init.d/openca start




