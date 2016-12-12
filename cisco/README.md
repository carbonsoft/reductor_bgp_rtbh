Хук event.sh идентичен как и для mx80 (надо только поменять comminity на свое и IP для ebgp сессии)


`interface Null0`

`no ip unreachables`

`ip community-list standard black-hole permit 50XXX:666` - комьюнити блекхола для ASки

`router bgp 50XXX`

`neighbor XX.XX.XX.XX remote-as 65XXX` - для редуктора я взял приватную AS

`neighbor XX.XX.XX.XX ebgp-multihop 3` - это нужно если редуктор и бордер находятся не директ коннект

`neighbor XX.XX.XX.XX activate`

`neighbor XX.XX.XX.XX route-map BLACK-HOLE in` - route-map который и делает всю магию

`route-map BLACK-HOLE permit 10`

`match community black-hole` - все маршруты, которые приняты с коммюнитри блек-хола

`set ip next-hop 172.16.0.1` - выставить next-hop на приватный IP.

`ip route vrf br-bgp 172.16.0.1 255.255.255.255 Null0` - приватный IP заварачиваем в NULL
