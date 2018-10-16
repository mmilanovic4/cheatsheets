# Мрежне наредбе за Линукс ОС

**Мрежни сервис**

```
sudo /etc/init.d/networking {start|stop|restart|status}
sudo systemctl {start|stop|restart|enable|disable|status} networking.service
```

**arp - менаџмент ARP кеша**

```
# Листа свих записа
arp
...
# Листа свих записа за одређену ИП адресу
arp 192.168.0.1
...
# Додавање новог записа (привремено!)
sudo arp -s 192.168.0.20 00:11:22:33:44:55 temp
...
# Уклањање записа
sudo arp -d 192.168.0.20
```

**ifconfig/route и ip-link/ip-address/ip-route: конфигурација мрежних адаптера**

```
# Сви мрежни интерфејси
ifconfig -a
ip link show
...
# Само укључени мрежни интерфејси
ifconfig
ip link show up
...
# Само lo интерфејс
ifconfig lo
ip link show dev lo
...
# Искључивање eth0 интерфејса
sudo ifconfig eth0 down
sudo ip link set dev eth0 down
...
# Укључивање eth0 интерфејса
sudo ifconfig eth0 up
sudo ip link set dev eth0 up
...
# Измена адресе Интернет протокола: ifconfig + route
sudo ifconfig eth0 192.168.0.15 netmask 255.255.255.0 broadcast 192.168.0.255
route add default gw 192.168.0.1 metric 1 dev eth0
ifconfig eth0
route
...
# Измена адресе Интернет протокола: ip-address + ip-route
sudo ip address delete 192.168.0.15/24 dev eth0
sudo ip address add 192.168.0.17/24 broadcast 192.168.0.255 dev eth0
sudo ip route add default via 192.168.0.1 metric 1 dev eth0
ip link show dev eth0
ip route show
...
# Измена физичке адресе: ifconfig
sudo ifconfig eth0 down
ifconfig eth0 hw ether 00:11:22:33:44:55
sudo ifconfig eth0 up
...
# Измена физичке адресе: ip-link
sudo ip link set dev eth0 down
sudo ip link set dev eth0 address 00:11:22:33:44:55
sudo ip link set dev eth0 up
...
# Укључивање/искључивање PROMISC мода: ifconfig
sudo ifconfig eth0 promisc
sudo ifconfig eth0 -promisc
...
# Укључивање/искључивање PROMISC мода: ip-link
sudo ip link set dev eth0 promisc on
sudo ip link set dev eth0 promisc off
```

**Алати за мрежну дијагностику: ping и traceroute**

```
# ping
ping google.com -c 4
...
# traceroute
mtr google.com -c 4
```

**DNS алати: host, dig, nslookup**

```
host -t A google.com 8.8.8.8
...
dig -t A google.com @8.8.8.8
...
# Интерактивни
# За избор типа записа користимо нпр. set type=A
nslookup
```

**UFW - фронт-енд за iptables**

```
# Покретање UFW
sudo ufw enable
sudo ufw status
...
# ALLOW правило
sudo ufw allow http
sudo ufw allow 80/tcp
...
# REJECT правило
sudo ufw reject from 192.168.0.15
sudo ufw reject telnet
...
# DROP правило
sudo ufw deny from 192.168.0.15
...
# Уклањање правила
sudo ufw allow from 192.168.0.1 proto tcp to any port 81
sudo ufw delete allow from 192.168.0.1 proto tcp to any port 81
sudo ufw show added
...
# Уклањање правила по ИД параметру
sudo ufw status numbered
sudo ufw delete 3
...
# Лимитирање по ИП адреси - заштита од brute-force напада
sudo ufw limit ssh
```

**Nmap - мрежно извиђање**

```
# Хоризонтално скенирање
nmap 192.168.0.1
nmap 192.168.0.1 192.168.0.2
nmap -sn 192.168.0.*
...
# Вертикално скенирање
nmap 192.168.0.1 -p 1-65535
nmap 192.168.0.1 -p 80
nmap 192.168.0.1 -p 22,23
...
# Дубинско скенирање
sudo nmap -O 192.168.0.1
```

**netstat - мрежна статистика**

```
# Активне TCP конекције
netstat --all --tcp
netstat -at
...
# Активне UDP конекције
netstat --all --udp
netstat -au
...
# Активне TCP и UDP конекције
netstat -atu
...
# Активне UNIX сокет конекције
netstat --all --unix
netstat -ax
...
# Активне RAW сокет конекције
netstat --all --raw
netstat -ar
...
# Искључивање разрешивања адреса ИП у домене
netstat --all --tcp --numeric
netstat -atn
...
# Приказивање и ПИД-а и назива процеса који контролише сокет
netstat --all --tcp --numeric --program
netstat -atnp
...
# Провера да ли је одређени порт активан
netstat -an | grep :3306
```

**Netcat алат**

```
# TCP сервер (једнократни)
nc -lv 127.0.0.1 -p 1234
...
# TCP сервер
nc -lkv 127.0.0.1 -p 1234
...
# TCP клијент
nc 127.0.0.1 1234
...
# TCP симплекс клијент
nc -d 127.0.0.1 1234
...
# UDP сервер
nc -luv 127.0.0.1 -p 1234
...
# UDP клијент
nc -u 127.0.0.1 1234
...
# Пренос фајла: сервер
nc -l 127.0.0.1 -p 1234 > server.txt
...
# Пренос фајла: клијент
cat client.txt | nc 127.0.0.1 1234
...
# HTTP захтев
nc example.com 80
GET / HTTP/1.1
Accept: text/html
Connection: close
Host: example.com
User-Agent: Agent Smith v2.0

...
# Приказ SSH банера
nc -v 192.168.0.20 22
```

**tcpdump - снимање мрежног саобраћаја**

```
# Листа доступних интерфејса
tcpdump -D
...
# Снимање у фајл за каснији преглед
sudo tcpdump -i eth0 -w traffic.pcap
...
# Преглед фајла преко tcpdump (графичка алтернатива: Wireshark)
tcpdump -r traffic.pcap
...
# Коришћење филтера
sudo tcpdump -i any host 192.168.0.1
sudo tcpdump -i any src 192.168.0.1
sudo tcpdump -i any icmp and dst 192.168.0.1
sudo tcpdump -i any tcp and dst port 443
sudo tcpdump -i any udp and portrange 1234-1238 and not port 1235
```
