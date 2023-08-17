yum install -y epel-release
yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm

yum install -y php82 php82-php-fpm php82-php-cli php82-php-mysqlnd php82-php-gd php82-php-ldap php82-php-odbc php82-php-pdo php82-php-pear php82-php-xml php82-php-xmlrpc php82-php-mbstring php82-php-snmp php82-php-soap php82-php-zip php82-php-opcache nginx git mc nano

cd /etc/
git clone https://github.com/faust3719/appHusky.git

cd appHusky
unalias cp
cp -r core/default/* /
