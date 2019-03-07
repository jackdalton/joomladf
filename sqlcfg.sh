#!/bin/bash

mysql -u root -e "CREATE DATABASE joomla;"
mysql -u root -e "GRANT ALL PRIVILEGES on joomla.* to 'joomla_user'@'localhost' identified by 'Welcome1';"
mysql -u root -e "FLUSH PRIVILEGES;"
