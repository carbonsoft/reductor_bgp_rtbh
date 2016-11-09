# Установка и настройка

    yum -y install quagga
    cd /etc/quagga/

Скопируйте содержимое файлов bgpd.conf и zebra.conf в соответствующие файлы в этой папке (из коробки могут отсутствовать).

Скопируйте содержимое файла events.sh в файл:

    /usr/local/Reductor/userinfo/hooks/events.sh

Создайте хук файрвола (см документацию, "свои правила файрвола") в котором будет разрешаться трафик для bgpd до нужного IP правилами:

    iptables -I INPUT -s $bgp_router_ip -j ACCEPT
    
и выполните

    chmod a+x /usr/local/Reductor/userinfo/hooks/events.sh
    service bgpd restart
    service reductor update
    
    /usr/local/Reductor/bin/events.sh
