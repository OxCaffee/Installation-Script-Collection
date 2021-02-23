# !/bin/bash

# =====================================================================
# This is a script for mysql5.7 single host installation
# Please make sure that you're in root mode
# MySQL version: 5.7
# This script will remove your previous installtion, be cautious

# Uninstall previous mysql installation and remove residual files
systemctl stop mysqld
yum remove mysql mysql-server mysql-libs
yum remove `rpm -qa | grep mysql`
rpm -ev `rpm -qa | grep mysql`
rm -rf mysql*
rm -rf `find /var -name mysql`
rm -rf `find /usr -name mysql`

# Update your system
yum -y update
mkdir /home/mysql
cd /home/mysql

# Start installation
wget https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
yum localinstall mysql57-community-release-el7-11.noarch.rpm
yum repolist enabled | grep "mysql.*-community.*"
yum install -y mysql-community-server

# Start mysql service
systemctl start mysqld
systemctl status mysqld

# Enable auto boot
systemctl enable mysqld
systemctl daemon-reload

# Here are some tips for you to do after the installation is over
echo "====================================================================="
echo "      The following steps you should take to fully install           "
echo "====================================================================="
echo "Enter your mysql using default password, your default password is blow:"
echo `grep 'temporary password' /var/log/mysqld.log`
echo "====================================================================="
echo " Command1: shell> mysql -uroot -p"
echo " Command2: mysql> ALTER USER 'root'@'localhost' IDENTIFIED BY 'MySQL5!';"
echo " Command3: mysql> GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'MySQL5!' WITH GRANT OPTION;"
echo " Command4: mysql> FLUSH PRIVILEGES;"
echo "======================================================================"



