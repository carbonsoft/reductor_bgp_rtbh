#!/bin/bash

save_bgp_conf() {
	echo "wr m" | vtysh
}

# отправить на оборудование команду на блокирование ip адреса
ip_block_full_add() {
	local ip="$1"
	read SEQ < $TMPDIR/blockseq
	SEQ=${SEQ:-0}
	let SEQ+=5
	echo $SEQ > $TMPDIR/blockseq
	echo $SEQ
	{
		echo "conf t"
		echo "ip prefix-list BLACKHOLE seq $SEQ permit $ip/32"
		echo "ip route $ip/32 Null0"
		echo "end"
		echo "clear ip bgp * soft"
	} | vtysh
	save_bgp_conf
}

# отправить на оборудование команду на снятие блокировки ip адреса
ip_block_full_del() {
	local ip="$1"
	{
		echo "conf t"
		echo "no ip prefix-list BLACKHOLE permit $ip/32"
		echo "no ip route $ip/32 Null0"
		echo "end"
		echo "clear ip bgp * soft"
	} | vtysh
	save_bgp_conf
}

# получить список заблокированных ip адресов
ip_block_full_get() {
	echo -ne "show ip route static" | vtysh > $HOOKDIR/ip_route.txt
	egrep -o "$ip_regex" $HOOKDIR/ip_route.txt | tee $HOOKDIR/ip.txt
}
