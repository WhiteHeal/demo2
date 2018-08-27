#!/bin/bash

apt -y update
apt -y groupinstall development  # Group which is a predefined bundle of software that can be installed at once, instead of having to install each application separately.

# Installation and setting git.

apt-get -y install git
mkdir /root/demo2
cd /root/demo2
git init

# Installation and setting dpkg utilitis.

apt-get -y install dpkg debconf debhelper lintian
mkdir ~/develop
mkdir -p ~/develop/DEBIAN
mkdir -p ~/develop/usr
mkdir -p ~/develop/usr/bin

# Installation python3.4

apt install -y build-essential checkinstall
apt install -y libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev openssl
wget https://www.python.org/ftp/python/3.4.3/Python-3.4.3.tgz
tar xzvf Python-3.4.3.tgz
cd Python-3.4.3
./configure --enable-shared --prefix=/usr/local LDFLAGS="-Wl,--rpath=/usr/local/lib"
sudo make install

# Installing Postgresql.

apt-get -y install postgresql postgresql-contrib

# Create database and user

su - postgres -c  'psql -c "CREATE DATABASE test_db;"'
sudo  -u postgres   psql -c "CREATE USER test_user WITH password '12345';"
su - postgres -c 'psql -c "GRANT ALL privileges ON DATABASE test_db TO test_user;"'

echo "modifed file /var/lib/pgsql/data/pg_hba.conf  for connect to database use password"
sed  's/127.0.0.1\/32            ident/127.0.0.1\/32            md5/g'  /etc/postgresql/9.5/main/pg_hba.conf -i

# restart postgres

systemctl restart postgresql.service

# requirements
pip3 install Django==2.0.8 # Install Django
pip3 install psycopg2-binary==2.7.5
pip3 install pytz==2018.5
