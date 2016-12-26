# Установка и настройка

```
yum -y install quagga
cd /etc/quagga/
```

Скопируйте содержимое файлов bgpd.conf и zebra.conf в соответствующие файлы в этой папке (из коробки могут отсутствовать).

Скопируйте содержимое файла events.sh в файл:
    /usr/local/Reductor/userinfo/hooks/events.sh
```	
chmod a+x /usr/local/Reductor/userinfo/hooks/events.sh
```
	
Скопируйте содержимое файла firewall.sh в файл:
    /usr/local/Reductor/userinfo/hooks/firewall.sh

```	
chmod a+x /usr/local/Reductor/userinfo/hooks/firewall.sh
```
	
В файле cisco_3750.conf пример настройки BGP для Cisco 3750

Применяем настройки:
````
service zebra restart
service bgpd restart
service reductor restart
```
    
Проверяем работу:
```
/usr/local/Reductor/bin/events.sh
```