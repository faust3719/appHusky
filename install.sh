#!/bin/bash

clear
echo "Начинаем установка appHusky"
echo ""
echo "Отключили SELINUX"

setenforce 0 &>/dev/null
sed -i 's/^SELINUX=.*/SELINUX=disabled/g' /etc/selinux/config &>/dev/null

echo ""
echo "Установка ядра системы"
yum install -y epel-release &>/dev/null
yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm &>/dev/null

yum install -y php82 php82-php-fpm php82-php-cli php82-php-mysqlnd php82-php-gd php82-php-ldap php82-php-odbc php82-php-pdo php82-php-pear php82-php-xml php82-php-xmlrpc php82-php-mbstring php82-php-snmp php82-php-soap php82-php-zip php82-php-opcache php82-php-pecl-pam nginx git mc nano iptables wget &>/dev/null

ip_world=$(wget -qO- http://core.brainycp.ru/ipchecker.php)

systemctl enable nginx &>/dev/null
systemctl enable --now php82-php-fpm &>/dev/null

cd /etc/
git clone https://github.com/faust3719/appHusky.git &>/dev/null

cd appHusky
unalias cp &>/dev/null
cp -r core/default/* / &>/dev/null

adduser appHusky &>/dev/null
gpasswd -a appHusky wheel &>/dev/null
gpasswd -a appHusky root &>/dev/null
chmod -R 775 /var/appHusky &>/dev/null
chmod -R 777 /usr/share/appHusky &>/dev/null

mkdir -p /run/php &>/dev/null
mkdir -p /var/appHusky/log/nginx/default &>/dev/null
mkdir -p /var/appHusky/log/system/nginx &>/dev/null

systemctl restart nginx &>/dev/null
systemctl restart php82-php-fpm &>/dev/null

echo ""
echo "Ядро установлено для продолжения работы перейдите по:"
echo "http://$ip_world:8500/"
echo "https://$ip_world:8863/"
echo "Login: root"
echo "Password: YOUR ROOT PASSWORD"
echo ""
echo "Спасибо, что решили воспользоваться системой управления сервером appHusky"
echo "http://apphusky.ru/"

