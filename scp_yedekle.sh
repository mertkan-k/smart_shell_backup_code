#!/bin/bash
clear
echo "------------------------------------------------------"
echo "------------------------------------------------------"
echo "        Scorpion1453 Smart Backup Shell Code"
echo "------------------------------------------------------"
echo "           Please enter your backup type"
echo "        1 -> Set Backup,  2 -> Install Backup"
echo "         If you want cancel, push CTRL+C key"
echo "------------------------------------------------------"
echo "------------------------------------------------------"
read yedek_type
case $yedek_type in
1)
	echo "           Please enter your backup name"
	echo "         If you want cancel, push CTRL+C key"
	echo "------------------------------------------------------"
	echo "------------------------------------------------------"
	read yedek_ismi
	echo "          Please only wait for backup.."
	echo "------------------------------------------------------"
	echo "------------------------------------------------------"
	mkdir /$yedek_ismi
	cd /var/db
	tar -zcf /$yedek_ismi/mysql.tar.gz mysql
	cd /usr
	tar -zcf /$yedek_ismi/game.tar.gz game
	cd /usr/alt_yapi/Server
	tar -zcf /$yedek_ismi/src.tar.gz common db game
	echo "                     Completed"
	echo "------------------------------------------------------"
	echo "------------------------------------------------------"
;;
2)
	echo "           Please enter your backup name"
	echo "         If you want cancel, push CTRL+C key"
	echo "------------------------------------------------------"
	echo "------------------------------------------------------"
	read yedek_ismi
	echo "         Please only wait for installing.."
	echo "------------------------------------------------------"
	echo "------------------------------------------------------"
	cd /var/db
	rm -rf mysql
	tar -zxf /$yedek_ismi/mysql.tar.gz
	cd /usr
	rm -rf game
	tar -zxf /$yedek_ismi/game.tar.gz
	cd /usr/alt_yapi/Server
	rm -rf game db common
	tar -zxf /$yedek_ismi/src.tar.gz
	echo "                     Completed"
	echo "            Are you want reboot? 1 -> Yes"
	echo "------------------------------------------------------"
	echo "------------------------------------------------------"
	read rrboot
	case $rrboot in
	1)
	reboot
	;;
	*)
	echo "                       Cancel"
	esac
;;
*)
	echo "                       Cancel"
esac
