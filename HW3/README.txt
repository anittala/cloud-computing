TASK 1:

Q1. What is the output of “nodes” and “net”?
Ans.

Nodes:
mininet> nodes
available nodes are:
h1 h2 h3 h4 h5 h6 h7 h8 s1 s2 s3 s4 s5 s6 s7

Net:
mininet> net
h1 h1-eth0:s3-eth2
h2 h2-eth0:s3-eth3
h3 h3-eth0:s4-eth2
h4 h4-eth0:s4-eth3
h5 h5-eth0:s6-eth2
h6 h6-eth0:s6-eth3
h7 h7-eth0:s7-eth2
h8 h8-eth0:s7-eth3
s1 lo:  s1-eth1:s2-eth1 s1-eth2:s5-eth1
s2 lo:  s2-eth1:s1-eth1 s2-eth2:s3-eth1 s2-eth3:s4-eth1
s3 lo:  s3-eth1:s2-eth2 s3-eth2:h1-eth0 s3-eth3:h2-eth0
s4 lo:  s4-eth1:s2-eth3 s4-eth2:h3-eth0 s4-eth3:h4-eth0
s5 lo:  s5-eth1:s1-eth2 s5-eth2:s6-eth1 s5-eth3:s7-eth1
s6 lo:  s6-eth1:s5-eth2 s6-eth2:h5-eth0 s6-eth3:h6-eth0
s7 lo:  s7-eth1:s5-eth3 s7-eth2:h7-eth0 s7-eth3:h8-eth0

Q2. What is the output of “h7 ifconfig”?
Ans.
mininet> h7 ifconfig
h7-eth0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
    	inet 10.0.0.7  netmask 255.0.0.0  broadcast 10.255.255.255
    	inet6 fe80::8d0:68ff:fed3:83cb  prefixlen 64  scopeid 0x20<link>
    	ether 0a:d0:68:d3:83:cb  txqueuelen 1000  (Ethernet)
    	RX packets 216  bytes 23566 (23.5 KB)
    	RX errors 0  dropped 0  overruns 0  frame 0
    	TX packets 12  bytes 936 (936.0 B)
    	TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
    	inet 127.0.0.1  netmask 255.0.0.0
    	inet6 ::1  prefixlen 128  scopeid 0x10<host>
    	loop  txqueuelen 1000  (Local Loopback)
    	RX packets 0  bytes 0 (0.0 B)
    	RX errors 0  dropped 0  overruns 0  frame 0
    	TX packets 0  bytes 0 (0.0 B)
    	TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

--------------------------------------------------------------------------------------------------------------------------------------

TASK 2:

Q1. Draw the function call graph of this controller. For example, once a packet comes to the
controller, which function is the first to be called, which one is the second, and so forth?
Ans. 
Function call graph:
start switch : _handle_PacketIn() -> act_like_hub() -> resend_packet() -> send(msg)

        packet comes in
	
        |
        V
	,__________________,
	|                  |
	| _handle_PacketIn |
	|__________________|
	
	    |
	    V
	,__________________,
	|                  |
	|   act_like_hub   |   
	|__________________|
	
	    |
	    V
	,__________________,
	|                  |
	|  resend_packet   |
	|__________________|
		
	    |
	    V

     forward message to the port


Q2. Have h1 ping h2, and h1 ping h8 for 100 times (e.g., h1 ping -c100 p2).
Ans.

h1 ping -c100 h2:
mininet> h1 ping -c100 h2
PING 10.0.0.2 (10.0.0.2) 56(84) bytes of data.
64 bytes from 10.0.0.2: icmp_seq=1 ttl=64 time=12.9 ms
64 bytes from 10.0.0.2: icmp_seq=2 ttl=64 time=5.66 ms
64 bytes from 10.0.0.2: icmp_seq=3 ttl=64 time=5.81 ms
64 bytes from 10.0.0.2: icmp_seq=4 ttl=64 time=4.61 ms
64 bytes from 10.0.0.2: icmp_seq=5 ttl=64 time=3.55 ms
64 bytes from 10.0.0.2: icmp_seq=6 ttl=64 time=3.73 ms
64 bytes from 10.0.0.2: icmp_seq=7 ttl=64 time=13.7 ms
64 bytes from 10.0.0.2: icmp_seq=8 ttl=64 time=10.6 ms
64 bytes from 10.0.0.2: icmp_seq=9 ttl=64 time=6.49 ms
64 bytes from 10.0.0.2: icmp_seq=10 ttl=64 time=2.67 ms
64 bytes from 10.0.0.2: icmp_seq=11 ttl=64 time=5.08 ms
64 bytes from 10.0.0.2: icmp_seq=12 ttl=64 time=4.31 ms
64 bytes from 10.0.0.2: icmp_seq=13 ttl=64 time=3.82 ms
64 bytes from 10.0.0.2: icmp_seq=14 ttl=64 time=8.23 ms
64 bytes from 10.0.0.2: icmp_seq=15 ttl=64 time=6.23 ms
64 bytes from 10.0.0.2: icmp_seq=16 ttl=64 time=3.23 ms
64 bytes from 10.0.0.2: icmp_seq=17 ttl=64 time=17.9 ms
64 bytes from 10.0.0.2: icmp_seq=18 ttl=64 time=3.37 ms
64 bytes from 10.0.0.2: icmp_seq=19 ttl=64 time=2.68 ms
64 bytes from 10.0.0.2: icmp_seq=20 ttl=64 time=5.13 ms
64 bytes from 10.0.0.2: icmp_seq=21 ttl=64 time=5.47 ms
64 bytes from 10.0.0.2: icmp_seq=22 ttl=64 time=4.73 ms
64 bytes from 10.0.0.2: icmp_seq=23 ttl=64 time=3.61 ms
64 bytes from 10.0.0.2: icmp_seq=24 ttl=64 time=3.84 ms
64 bytes from 10.0.0.2: icmp_seq=25 ttl=64 time=5.07 ms
64 bytes from 10.0.0.2: icmp_seq=26 ttl=64 time=3.34 ms
64 bytes from 10.0.0.2: icmp_seq=27 ttl=64 time=9.84 ms
64 bytes from 10.0.0.2: icmp_seq=28 ttl=64 time=3.22 ms
64 bytes from 10.0.0.2: icmp_seq=29 ttl=64 time=2.54 ms
64 bytes from 10.0.0.2: icmp_seq=30 ttl=64 time=2.85 ms
64 bytes from 10.0.0.2: icmp_seq=31 ttl=64 time=4.03 ms
64 bytes from 10.0.0.2: icmp_seq=32 ttl=64 time=3.37 ms
64 bytes from 10.0.0.2: icmp_seq=33 ttl=64 time=3.62 ms
64 bytes from 10.0.0.2: icmp_seq=34 ttl=64 time=3.63 ms
64 bytes from 10.0.0.2: icmp_seq=35 ttl=64 time=4.52 ms
64 bytes from 10.0.0.2: icmp_seq=36 ttl=64 time=2.47 ms
64 bytes from 10.0.0.2: icmp_seq=37 ttl=64 time=4.73 ms
64 bytes from 10.0.0.2: icmp_seq=38 ttl=64 time=6.85 ms
64 bytes from 10.0.0.2: icmp_seq=39 ttl=64 time=11.7 ms
64 bytes from 10.0.0.2: icmp_seq=40 ttl=64 time=4.56 ms
64 bytes from 10.0.0.2: icmp_seq=41 ttl=64 time=3.61 ms
64 bytes from 10.0.0.2: icmp_seq=42 ttl=64 time=1.65 ms
64 bytes from 10.0.0.2: icmp_seq=43 ttl=64 time=2.56 ms
64 bytes from 10.0.0.2: icmp_seq=44 ttl=64 time=2.50 ms
64 bytes from 10.0.0.2: icmp_seq=45 ttl=64 time=3.83 ms
64 bytes from 10.0.0.2: icmp_seq=46 ttl=64 time=3.03 ms
64 bytes from 10.0.0.2: icmp_seq=47 ttl=64 time=6.13 ms
64 bytes from 10.0.0.2: icmp_seq=48 ttl=64 time=13.1 ms
64 bytes from 10.0.0.2: icmp_seq=49 ttl=64 time=4.60 ms
64 bytes from 10.0.0.2: icmp_seq=50 ttl=64 time=7.36 ms
64 bytes from 10.0.0.2: icmp_seq=51 ttl=64 time=8.15 ms
64 bytes from 10.0.0.2: icmp_seq=52 ttl=64 time=5.06 ms
64 bytes from 10.0.0.2: icmp_seq=53 ttl=64 time=4.01 ms
64 bytes from 10.0.0.2: icmp_seq=54 ttl=64 time=2.71 ms
64 bytes from 10.0.0.2: icmp_seq=55 ttl=64 time=4.41 ms
64 bytes from 10.0.0.2: icmp_seq=56 ttl=64 time=4.05 ms
64 bytes from 10.0.0.2: icmp_seq=57 ttl=64 time=4.12 ms
64 bytes from 10.0.0.2: icmp_seq=58 ttl=64 time=3.46 ms
64 bytes from 10.0.0.2: icmp_seq=59 ttl=64 time=4.60 ms
64 bytes from 10.0.0.2: icmp_seq=60 ttl=64 time=5.99 ms
64 bytes from 10.0.0.2: icmp_seq=61 ttl=64 time=3.99 ms
64 bytes from 10.0.0.2: icmp_seq=62 ttl=64 time=3.77 ms
64 bytes from 10.0.0.2: icmp_seq=63 ttl=64 time=4.31 ms
64 bytes from 10.0.0.2: icmp_seq=64 ttl=64 time=7.88 ms
64 bytes from 10.0.0.2: icmp_seq=65 ttl=64 time=7.97 ms
64 bytes from 10.0.0.2: icmp_seq=66 ttl=64 time=8.90 ms
64 bytes from 10.0.0.2: icmp_seq=67 ttl=64 time=10.5 ms
64 bytes from 10.0.0.2: icmp_seq=68 ttl=64 time=5.85 ms
64 bytes from 10.0.0.2: icmp_seq=69 ttl=64 time=9.58 ms
64 bytes from 10.0.0.2: icmp_seq=70 ttl=64 time=9.85 ms
64 bytes from 10.0.0.2: icmp_seq=71 ttl=64 time=4.26 ms
64 bytes from 10.0.0.2: icmp_seq=72 ttl=64 time=6.43 ms
64 bytes from 10.0.0.2: icmp_seq=73 ttl=64 time=2.83 ms
64 bytes from 10.0.0.2: icmp_seq=74 ttl=64 time=12.1 ms
64 bytes from 10.0.0.2: icmp_seq=75 ttl=64 time=2.14 ms
64 bytes from 10.0.0.2: icmp_seq=76 ttl=64 time=1.52 ms
64 bytes from 10.0.0.2: icmp_seq=77 ttl=64 time=7.42 ms
64 bytes from 10.0.0.2: icmp_seq=78 ttl=64 time=6.43 ms
64 bytes from 10.0.0.2: icmp_seq=79 ttl=64 time=5.12 ms
64 bytes from 10.0.0.2: icmp_seq=80 ttl=64 time=5.68 ms
64 bytes from 10.0.0.2: icmp_seq=81 ttl=64 time=7.43 ms
64 bytes from 10.0.0.2: icmp_seq=82 ttl=64 time=4.24 ms
64 bytes from 10.0.0.2: icmp_seq=83 ttl=64 time=3.32 ms
64 bytes from 10.0.0.2: icmp_seq=84 ttl=64 time=7.48 ms
64 bytes from 10.0.0.2: icmp_seq=85 ttl=64 time=2.19 ms
64 bytes from 10.0.0.2: icmp_seq=86 ttl=64 time=4.53 ms
64 bytes from 10.0.0.2: icmp_seq=87 ttl=64 time=3.54 ms
64 bytes from 10.0.0.2: icmp_seq=88 ttl=64 time=3.94 ms
64 bytes from 10.0.0.2: icmp_seq=89 ttl=64 time=3.40 ms
64 bytes from 10.0.0.2: icmp_seq=90 ttl=64 time=9.86 ms
64 bytes from 10.0.0.2: icmp_seq=91 ttl=64 time=4.56 ms
64 bytes from 10.0.0.2: icmp_seq=92 ttl=64 time=4.13 ms
64 bytes from 10.0.0.2: icmp_seq=93 ttl=64 time=3.75 ms
64 bytes from 10.0.0.2: icmp_seq=94 ttl=64 time=3.72 ms
64 bytes from 10.0.0.2: icmp_seq=95 ttl=64 time=4.45 ms
64 bytes from 10.0.0.2: icmp_seq=96 ttl=64 time=4.39 ms
64 bytes from 10.0.0.2: icmp_seq=97 ttl=64 time=4.33 ms
64 bytes from 10.0.0.2: icmp_seq=98 ttl=64 time=3.93 ms
64 bytes from 10.0.0.2: icmp_seq=99 ttl=64 time=10.2 ms
64 bytes from 10.0.0.2: icmp_seq=100 ttl=64 time=4.54 ms

--- 10.0.0.2 ping statistics ---
100 packets transmitted, 100 received, 0% packet loss, time 99231ms
rtt min/avg/max/mdev = 1.519/5.430/17.935/2.950 ms

h1 ping -c100 h8:
mininet> h1 ping -c100 h8
PING 10.0.0.8 (10.0.0.8) 56(84) bytes of data.
64 bytes from 10.0.0.8: icmp_seq=1 ttl=64 time=43.3 ms
64 bytes from 10.0.0.8: icmp_seq=2 ttl=64 time=27.4 ms
64 bytes from 10.0.0.8: icmp_seq=3 ttl=64 time=17.4 ms
64 bytes from 10.0.0.8: icmp_seq=4 ttl=64 time=17.4 ms
64 bytes from 10.0.0.8: icmp_seq=5 ttl=64 time=17.2 ms
64 bytes from 10.0.0.8: icmp_seq=6 ttl=64 time=23.9 ms
64 bytes from 10.0.0.8: icmp_seq=7 ttl=64 time=17.4 ms
64 bytes from 10.0.0.8: icmp_seq=8 ttl=64 time=19.5 ms
64 bytes from 10.0.0.8: icmp_seq=9 ttl=64 time=16.4 ms
64 bytes from 10.0.0.8: icmp_seq=10 ttl=64 time=15.2 ms
64 bytes from 10.0.0.8: icmp_seq=11 ttl=64 time=16.5 ms
64 bytes from 10.0.0.8: icmp_seq=12 ttl=64 time=18.6 ms
64 bytes from 10.0.0.8: icmp_seq=13 ttl=64 time=35.3 ms
64 bytes from 10.0.0.8: icmp_seq=14 ttl=64 time=27.5 ms
64 bytes from 10.0.0.8: icmp_seq=15 ttl=64 time=13.3 ms
64 bytes from 10.0.0.8: icmp_seq=16 ttl=64 time=18.3 ms
64 bytes from 10.0.0.8: icmp_seq=17 ttl=64 time=17.0 ms
64 bytes from 10.0.0.8: icmp_seq=18 ttl=64 time=40.2 ms
64 bytes from 10.0.0.8: icmp_seq=19 ttl=64 time=20.8 ms
64 bytes from 10.0.0.8: icmp_seq=20 ttl=64 time=28.3 ms
64 bytes from 10.0.0.8: icmp_seq=21 ttl=64 time=47.0 ms
64 bytes from 10.0.0.8: icmp_seq=22 ttl=64 time=77.4 ms
64 bytes from 10.0.0.8: icmp_seq=23 ttl=64 time=48.9 ms
64 bytes from 10.0.0.8: icmp_seq=24 ttl=64 time=37.1 ms
64 bytes from 10.0.0.8: icmp_seq=25 ttl=64 time=57.4 ms
64 bytes from 10.0.0.8: icmp_seq=26 ttl=64 time=20.3 ms
64 bytes from 10.0.0.8: icmp_seq=27 ttl=64 time=63.3 ms
64 bytes from 10.0.0.8: icmp_seq=28 ttl=64 time=37.2 ms
64 bytes from 10.0.0.8: icmp_seq=29 ttl=64 time=30.1 ms
64 bytes from 10.0.0.8: icmp_seq=30 ttl=64 time=19.3 ms
64 bytes from 10.0.0.8: icmp_seq=31 ttl=64 time=30.9 ms
64 bytes from 10.0.0.8: icmp_seq=32 ttl=64 time=20.5 ms
64 bytes from 10.0.0.8: icmp_seq=33 ttl=64 time=42.0 ms
64 bytes from 10.0.0.8: icmp_seq=34 ttl=64 time=19.0 ms
64 bytes from 10.0.0.8: icmp_seq=35 ttl=64 time=29.8 ms
64 bytes from 10.0.0.8: icmp_seq=36 ttl=64 time=24.1 ms
64 bytes from 10.0.0.8: icmp_seq=37 ttl=64 time=16.7 ms
64 bytes from 10.0.0.8: icmp_seq=38 ttl=64 time=17.3 ms
64 bytes from 10.0.0.8: icmp_seq=39 ttl=64 time=22.7 ms
64 bytes from 10.0.0.8: icmp_seq=40 ttl=64 time=18.1 ms
64 bytes from 10.0.0.8: icmp_seq=41 ttl=64 time=32.1 ms
64 bytes from 10.0.0.8: icmp_seq=42 ttl=64 time=18.0 ms
64 bytes from 10.0.0.8: icmp_seq=43 ttl=64 time=10.7 ms
64 bytes from 10.0.0.8: icmp_seq=44 ttl=64 time=11.8 ms
64 bytes from 10.0.0.8: icmp_seq=45 ttl=64 time=20.7 ms
64 bytes from 10.0.0.8: icmp_seq=46 ttl=64 time=12.8 ms
64 bytes from 10.0.0.8: icmp_seq=47 ttl=64 time=16.3 ms
64 bytes from 10.0.0.8: icmp_seq=48 ttl=64 time=17.4 ms
64 bytes from 10.0.0.8: icmp_seq=49 ttl=64 time=13.5 ms
64 bytes from 10.0.0.8: icmp_seq=50 ttl=64 time=28.1 ms
64 bytes from 10.0.0.8: icmp_seq=51 ttl=64 time=17.7 ms
64 bytes from 10.0.0.8: icmp_seq=52 ttl=64 time=47.6 ms
64 bytes from 10.0.0.8: icmp_seq=53 ttl=64 time=32.2 ms
64 bytes from 10.0.0.8: icmp_seq=54 ttl=64 time=16.6 ms
64 bytes from 10.0.0.8: icmp_seq=55 ttl=64 time=12.2 ms
64 bytes from 10.0.0.8: icmp_seq=56 ttl=64 time=25.8 ms
64 bytes from 10.0.0.8: icmp_seq=57 ttl=64 time=8.86 ms
64 bytes from 10.0.0.8: icmp_seq=58 ttl=64 time=7.11 ms
64 bytes from 10.0.0.8: icmp_seq=59 ttl=64 time=27.5 ms
64 bytes from 10.0.0.8: icmp_seq=60 ttl=64 time=11.3 ms
64 bytes from 10.0.0.8: icmp_seq=61 ttl=64 time=13.0 ms
64 bytes from 10.0.0.8: icmp_seq=62 ttl=64 time=20.4 ms
64 bytes from 10.0.0.8: icmp_seq=63 ttl=64 time=10.3 ms
64 bytes from 10.0.0.8: icmp_seq=64 ttl=64 time=11.1 ms
64 bytes from 10.0.0.8: icmp_seq=65 ttl=64 time=15.6 ms
64 bytes from 10.0.0.8: icmp_seq=66 ttl=64 time=13.9 ms
64 bytes from 10.0.0.8: icmp_seq=67 ttl=64 time=12.5 ms
64 bytes from 10.0.0.8: icmp_seq=68 ttl=64 time=29.4 ms
64 bytes from 10.0.0.8: icmp_seq=69 ttl=64 time=15.9 ms
64 bytes from 10.0.0.8: icmp_seq=70 ttl=64 time=17.3 ms
64 bytes from 10.0.0.8: icmp_seq=71 ttl=64 time=13.6 ms
64 bytes from 10.0.0.8: icmp_seq=72 ttl=64 time=12.7 ms
64 bytes from 10.0.0.8: icmp_seq=73 ttl=64 time=17.9 ms
64 bytes from 10.0.0.8: icmp_seq=74 ttl=64 time=16.3 ms
64 bytes from 10.0.0.8: icmp_seq=75 ttl=64 time=14.5 ms
64 bytes from 10.0.0.8: icmp_seq=76 ttl=64 time=16.2 ms
64 bytes from 10.0.0.8: icmp_seq=77 ttl=64 time=23.2 ms
64 bytes from 10.0.0.8: icmp_seq=78 ttl=64 time=19.3 ms
64 bytes from 10.0.0.8: icmp_seq=79 ttl=64 time=15.3 ms
64 bytes from 10.0.0.8: icmp_seq=80 ttl=64 time=26.0 ms
64 bytes from 10.0.0.8: icmp_seq=81 ttl=64 time=13.4 ms
64 bytes from 10.0.0.8: icmp_seq=82 ttl=64 time=20.3 ms
64 bytes from 10.0.0.8: icmp_seq=83 ttl=64 time=22.4 ms
64 bytes from 10.0.0.8: icmp_seq=84 ttl=64 time=64.6 ms
64 bytes from 10.0.0.8: icmp_seq=85 ttl=64 time=19.7 ms
64 bytes from 10.0.0.8: icmp_seq=86 ttl=64 time=16.0 ms
64 bytes from 10.0.0.8: icmp_seq=87 ttl=64 time=24.3 ms
64 bytes from 10.0.0.8: icmp_seq=88 ttl=64 time=25.8 ms
64 bytes from 10.0.0.8: icmp_seq=89 ttl=64 time=15.5 ms
64 bytes from 10.0.0.8: icmp_seq=90 ttl=64 time=17.7 ms
64 bytes from 10.0.0.8: icmp_seq=91 ttl=64 time=34.2 ms
64 bytes from 10.0.0.8: icmp_seq=92 ttl=64 time=11.3 ms
64 bytes from 10.0.0.8: icmp_seq=93 ttl=64 time=23.8 ms
64 bytes from 10.0.0.8: icmp_seq=94 ttl=64 time=18.1 ms
64 bytes from 10.0.0.8: icmp_seq=95 ttl=64 time=13.6 ms
64 bytes from 10.0.0.8: icmp_seq=96 ttl=64 time=12.9 ms
64 bytes from 10.0.0.8: icmp_seq=97 ttl=64 time=20.7 ms
64 bytes from 10.0.0.8: icmp_seq=98 ttl=64 time=30.1 ms
64 bytes from 10.0.0.8: icmp_seq=99 ttl=64 time=15.8 ms
64 bytes from 10.0.0.8: icmp_seq=100 ttl=64 time=20.3 ms

--- 10.0.0.8 ping statistics ---
100 packets transmitted, 100 received, 0% packet loss, time 99212ms
rtt min/avg/max/mdev = 7.105/22.934/77.402/12.433 ms

a. How long does it take (on average) to ping for each case?
For h1 ping h2 -> 5.430
For h1 ping h8 -> 22.934

b. What is the minimum and maximum ping you have observed?
Minimum:
For h1 ping h2 -> 1.519
For h1 ping h8 -> 7.105

Maximum:
For h1 ping h2 -> 17.935
For h1 ping h8 -> 77.402
 
c. What is the difference, and why?
Ans.
Ping times, which measure how long it takes to send and receive a data packet,
are substantially longer between h1 and h8 than they are between h1 and h2.
This is because there is only one switch (s3) on the path between h1 and h2,
whereas there are many switches on the route between h1 and h8 (s3, s2, s1, s5, s7).


Q3. Run “iperf h1 h2” and “iperf h1 h8”

iperf h1 h2:
mininet> iperf h1 h2
*** Iperf: testing TCP bandwidth between h1 and h2
*** Results: ['9.50 Mbits/sec', '11.0 Mbits/sec']

iperf h1 h8:
mininet> iperf h1 h8
*** Iperf: testing TCP bandwidth between h1 and h8
*** Results: ['5.72 Mbits/sec', '6.22 Mbits/sec']


a. What is “iperf” used for?
Ans. 
The free program iperf enables network administrators to evaluate the efficiency
and quality of a network connection by calculating the bandwidth between two hosts.
This statistic contributes to determining the maximum quantity of data that can be
transported via the network link. Basically, Iperf makes it possible to verify the data
throughput between any two network nodes.

b. What is the throughput for each case?
Ans. 
For iperf h1 h2: Results: ['9.50 Mbits/sec', '11.0 Mbits/sec']
For iperf h1 h8: Results: ['5.72 Mbits/sec', '6.22 Mbits/sec']

c. What is the difference, and explain the reasons for the difference.
Ans. 
The data transmission rate between h1 and h2 is faster than h1 and h8 because of
network latency and congestion, which also affect ping time. The shorter distance
between h1 and h2 allows for fewer intermediate stops, which allows for more data to be
transferred more quickly. Due to the greater distance between h1 and h8, which necessitates
more intermediate breaks, the amount of data that can be delivered in a given period is
decreased.


Q4. Which of the switches observe traffic? Please describe your way for observing such
traffic on switches (e.g., adding some functions in the “of_tutorial” controller).
Ans. 
We can inspect the information that aids in traffic observation by adding
log.info("Switch observing traffic:%s" % (self.connection)) to the
"of tutorial" controller. We can infer from it that all switches view the traffic,
particularly when they are all inundated with packets. The event listener,
_handle PacketIn, is invoked each time a packet is received.

---------------------------------------------------------------------------------------------------------------------------------------------------------------

TASK 3:

Q1. Describe how the above code works, such as how the "MAC to Port" map is established.
You could use a ‘ping’ example to describe the establishment process (e.g., h1 ping h2).
Ans.
If a MAC address is frequently used, the switch function, also referred to as
"act like switch," has the capacity to learn the locations of MAC addresses, making
it simple for the controller to map a MAC address to a port. By sending the packets to
the proper port, this increases the controller's effectiveness in delivering them to known
addresses. The function transmits the packet to all destinations if the destination address
is not known. The MAC Learning controller also aids in enhancing ping times and
throughputs by lowering the frequency of packet flooding.


Q2. (Comment out all prints before doing this experiment) Have h1 ping h2, and h1 ping
h8 for 100 times (e.g., h1 ping -c100 p2).

h1 ping -c100 h2
mininet> h1 ping -c100 h2
PING 10.0.0.2 (10.0.0.2) 56(84) bytes of data.
64 bytes from 10.0.0.2: icmp_seq=1 ttl=64 time=23.1 ms
64 bytes from 10.0.0.2: icmp_seq=2 ttl=64 time=8.03 ms
64 bytes from 10.0.0.2: icmp_seq=3 ttl=64 time=6.03 ms
64 bytes from 10.0.0.2: icmp_seq=4 ttl=64 time=8.15 ms
64 bytes from 10.0.0.2: icmp_seq=5 ttl=64 time=2.88 ms
64 bytes from 10.0.0.2: icmp_seq=6 ttl=64 time=6.22 ms
64 bytes from 10.0.0.2: icmp_seq=7 ttl=64 time=5.97 ms
64 bytes from 10.0.0.2: icmp_seq=8 ttl=64 time=3.39 ms
64 bytes from 10.0.0.2: icmp_seq=9 ttl=64 time=4.06 ms
64 bytes from 10.0.0.2: icmp_seq=10 ttl=64 time=5.02 ms
64 bytes from 10.0.0.2: icmp_seq=11 ttl=64 time=3.79 ms
64 bytes from 10.0.0.2: icmp_seq=12 ttl=64 time=3.89 ms
64 bytes from 10.0.0.2: icmp_seq=13 ttl=64 time=5.85 ms
64 bytes from 10.0.0.2: icmp_seq=14 ttl=64 time=7.28 ms
64 bytes from 10.0.0.2: icmp_seq=15 ttl=64 time=4.04 ms
64 bytes from 10.0.0.2: icmp_seq=16 ttl=64 time=6.74 ms
64 bytes from 10.0.0.2: icmp_seq=17 ttl=64 time=5.42 ms
64 bytes from 10.0.0.2: icmp_seq=18 ttl=64 time=3.84 ms
64 bytes from 10.0.0.2: icmp_seq=19 ttl=64 time=5.08 ms
64 bytes from 10.0.0.2: icmp_seq=20 ttl=64 time=3.24 ms
64 bytes from 10.0.0.2: icmp_seq=21 ttl=64 time=3.56 ms
64 bytes from 10.0.0.2: icmp_seq=22 ttl=64 time=4.36 ms
64 bytes from 10.0.0.2: icmp_seq=23 ttl=64 time=4.46 ms
64 bytes from 10.0.0.2: icmp_seq=24 ttl=64 time=2.49 ms
64 bytes from 10.0.0.2: icmp_seq=25 ttl=64 time=4.56 ms
64 bytes from 10.0.0.2: icmp_seq=26 ttl=64 time=4.38 ms
64 bytes from 10.0.0.2: icmp_seq=27 ttl=64 time=4.84 ms
64 bytes from 10.0.0.2: icmp_seq=28 ttl=64 time=3.98 ms
64 bytes from 10.0.0.2: icmp_seq=29 ttl=64 time=3.13 ms
64 bytes from 10.0.0.2: icmp_seq=30 ttl=64 time=5.44 ms
64 bytes from 10.0.0.2: icmp_seq=31 ttl=64 time=3.85 ms
64 bytes from 10.0.0.2: icmp_seq=32 ttl=64 time=3.75 ms
64 bytes from 10.0.0.2: icmp_seq=33 ttl=64 time=1.87 ms
64 bytes from 10.0.0.2: icmp_seq=34 ttl=64 time=1.97 ms
64 bytes from 10.0.0.2: icmp_seq=35 ttl=64 time=4.51 ms
64 bytes from 10.0.0.2: icmp_seq=36 ttl=64 time=6.42 ms
64 bytes from 10.0.0.2: icmp_seq=37 ttl=64 time=2.79 ms
64 bytes from 10.0.0.2: icmp_seq=38 ttl=64 time=4.33 ms
64 bytes from 10.0.0.2: icmp_seq=39 ttl=64 time=3.33 ms
64 bytes from 10.0.0.2: icmp_seq=40 ttl=64 time=3.57 ms
64 bytes from 10.0.0.2: icmp_seq=41 ttl=64 time=5.22 ms
64 bytes from 10.0.0.2: icmp_seq=42 ttl=64 time=4.84 ms
64 bytes from 10.0.0.2: icmp_seq=43 ttl=64 time=4.79 ms
64 bytes from 10.0.0.2: icmp_seq=44 ttl=64 time=3.50 ms
64 bytes from 10.0.0.2: icmp_seq=45 ttl=64 time=6.48 ms
64 bytes from 10.0.0.2: icmp_seq=46 ttl=64 time=5.54 ms
64 bytes from 10.0.0.2: icmp_seq=47 ttl=64 time=5.36 ms
64 bytes from 10.0.0.2: icmp_seq=48 ttl=64 time=10.2 ms
64 bytes from 10.0.0.2: icmp_seq=49 ttl=64 time=3.37 ms
64 bytes from 10.0.0.2: icmp_seq=50 ttl=64 time=5.95 ms
64 bytes from 10.0.0.2: icmp_seq=51 ttl=64 time=2.87 ms
64 bytes from 10.0.0.2: icmp_seq=52 ttl=64 time=4.18 ms
64 bytes from 10.0.0.2: icmp_seq=53 ttl=64 time=2.56 ms
64 bytes from 10.0.0.2: icmp_seq=54 ttl=64 time=3.80 ms
64 bytes from 10.0.0.2: icmp_seq=55 ttl=64 time=5.66 ms
64 bytes from 10.0.0.2: icmp_seq=56 ttl=64 time=6.58 ms
64 bytes from 10.0.0.2: icmp_seq=57 ttl=64 time=6.44 ms
64 bytes from 10.0.0.2: icmp_seq=58 ttl=64 time=5.89 ms
64 bytes from 10.0.0.2: icmp_seq=59 ttl=64 time=3.23 ms
64 bytes from 10.0.0.2: icmp_seq=60 ttl=64 time=5.25 ms
64 bytes from 10.0.0.2: icmp_seq=61 ttl=64 time=1.99 ms
64 bytes from 10.0.0.2: icmp_seq=62 ttl=64 time=2.70 ms
64 bytes from 10.0.0.2: icmp_seq=63 ttl=64 time=3.25 ms
64 bytes from 10.0.0.2: icmp_seq=64 ttl=64 time=1.79 ms
64 bytes from 10.0.0.2: icmp_seq=65 ttl=64 time=6.46 ms
64 bytes from 10.0.0.2: icmp_seq=66 ttl=64 time=5.79 ms
64 bytes from 10.0.0.2: icmp_seq=67 ttl=64 time=2.97 ms
64 bytes from 10.0.0.2: icmp_seq=68 ttl=64 time=2.20 ms
64 bytes from 10.0.0.2: icmp_seq=69 ttl=64 time=2.82 ms
64 bytes from 10.0.0.2: icmp_seq=70 ttl=64 time=8.96 ms
64 bytes from 10.0.0.2: icmp_seq=71 ttl=64 time=4.07 ms
64 bytes from 10.0.0.2: icmp_seq=72 ttl=64 time=15.6 ms
64 bytes from 10.0.0.2: icmp_seq=73 ttl=64 time=6.16 ms
64 bytes from 10.0.0.2: icmp_seq=74 ttl=64 time=3.18 ms
64 bytes from 10.0.0.2: icmp_seq=75 ttl=64 time=8.01 ms
64 bytes from 10.0.0.2: icmp_seq=76 ttl=64 time=9.32 ms
64 bytes from 10.0.0.2: icmp_seq=77 ttl=64 time=4.34 ms
64 bytes from 10.0.0.2: icmp_seq=78 ttl=64 time=2.80 ms
64 bytes from 10.0.0.2: icmp_seq=79 ttl=64 time=4.61 ms
64 bytes from 10.0.0.2: icmp_seq=80 ttl=64 time=3.35 ms
64 bytes from 10.0.0.2: icmp_seq=81 ttl=64 time=3.43 ms
64 bytes from 10.0.0.2: icmp_seq=82 ttl=64 time=6.11 ms
64 bytes from 10.0.0.2: icmp_seq=83 ttl=64 time=4.31 ms
64 bytes from 10.0.0.2: icmp_seq=84 ttl=64 time=11.8 ms
64 bytes from 10.0.0.2: icmp_seq=85 ttl=64 time=2.97 ms
64 bytes from 10.0.0.2: icmp_seq=86 ttl=64 time=3.65 ms
64 bytes from 10.0.0.2: icmp_seq=87 ttl=64 time=4.97 ms
64 bytes from 10.0.0.2: icmp_seq=88 ttl=64 time=8.61 ms
64 bytes from 10.0.0.2: icmp_seq=89 ttl=64 time=4.72 ms
64 bytes from 10.0.0.2: icmp_seq=90 ttl=64 time=3.25 ms
64 bytes from 10.0.0.2: icmp_seq=91 ttl=64 time=2.59 ms
64 bytes from 10.0.0.2: icmp_seq=92 ttl=64 time=2.69 ms
64 bytes from 10.0.0.2: icmp_seq=93 ttl=64 time=3.23 ms
64 bytes from 10.0.0.2: icmp_seq=94 ttl=64 time=2.50 ms
64 bytes from 10.0.0.2: icmp_seq=95 ttl=64 time=3.67 ms
64 bytes from 10.0.0.2: icmp_seq=96 ttl=64 time=3.23 ms
64 bytes from 10.0.0.2: icmp_seq=97 ttl=64 time=2.51 ms
64 bytes from 10.0.0.2: icmp_seq=98 ttl=64 time=2.98 ms
64 bytes from 10.0.0.2: icmp_seq=99 ttl=64 time=5.09 ms
64 bytes from 10.0.0.2: icmp_seq=100 ttl=64 time=4.87 ms

--- 10.0.0.2 ping statistics ---
100 packets transmitted, 100 received, 0% packet loss, time 99306ms
rtt min/avg/max/mdev = 1.793/4.888/23.124/2.838 ms

h1 ping -c100 h8
mininet> h1 ping -c100 h8
PING 10.0.0.8 (10.0.0.8) 56(84) bytes of data.
64 bytes from 10.0.0.8: icmp_seq=1 ttl=64 time=44.3 ms
64 bytes from 10.0.0.8: icmp_seq=2 ttl=64 time=15.9 ms
64 bytes from 10.0.0.8: icmp_seq=3 ttl=64 time=21.4 ms
64 bytes from 10.0.0.8: icmp_seq=4 ttl=64 time=13.5 ms
64 bytes from 10.0.0.8: icmp_seq=5 ttl=64 time=11.5 ms
64 bytes from 10.0.0.8: icmp_seq=6 ttl=64 time=12.7 ms
64 bytes from 10.0.0.8: icmp_seq=7 ttl=64 time=21.0 ms
64 bytes from 10.0.0.8: icmp_seq=8 ttl=64 time=9.56 ms
64 bytes from 10.0.0.8: icmp_seq=9 ttl=64 time=11.6 ms
64 bytes from 10.0.0.8: icmp_seq=10 ttl=64 time=26.5 ms
64 bytes from 10.0.0.8: icmp_seq=11 ttl=64 time=16.7 ms
64 bytes from 10.0.0.8: icmp_seq=12 ttl=64 time=19.0 ms
64 bytes from 10.0.0.8: icmp_seq=13 ttl=64 time=50.4 ms
64 bytes from 10.0.0.8: icmp_seq=14 ttl=64 time=16.3 ms
64 bytes from 10.0.0.8: icmp_seq=15 ttl=64 time=12.6 ms
64 bytes from 10.0.0.8: icmp_seq=16 ttl=64 time=25.9 ms
64 bytes from 10.0.0.8: icmp_seq=17 ttl=64 time=18.0 ms
64 bytes from 10.0.0.8: icmp_seq=18 ttl=64 time=25.9 ms
64 bytes from 10.0.0.8: icmp_seq=19 ttl=64 time=10.6 ms
64 bytes from 10.0.0.8: icmp_seq=20 ttl=64 time=19.7 ms
64 bytes from 10.0.0.8: icmp_seq=21 ttl=64 time=14.8 ms
64 bytes from 10.0.0.8: icmp_seq=22 ttl=64 time=28.6 ms
64 bytes from 10.0.0.8: icmp_seq=23 ttl=64 time=28.3 ms
64 bytes from 10.0.0.8: icmp_seq=24 ttl=64 time=21.5 ms
64 bytes from 10.0.0.8: icmp_seq=25 ttl=64 time=19.6 ms
64 bytes from 10.0.0.8: icmp_seq=26 ttl=64 time=16.5 ms
64 bytes from 10.0.0.8: icmp_seq=27 ttl=64 time=8.56 ms
64 bytes from 10.0.0.8: icmp_seq=28 ttl=64 time=21.5 ms
64 bytes from 10.0.0.8: icmp_seq=29 ttl=64 time=35.1 ms
64 bytes from 10.0.0.8: icmp_seq=30 ttl=64 time=50.8 ms
64 bytes from 10.0.0.8: icmp_seq=31 ttl=64 time=17.4 ms
64 bytes from 10.0.0.8: icmp_seq=32 ttl=64 time=16.2 ms
64 bytes from 10.0.0.8: icmp_seq=33 ttl=64 time=18.3 ms
64 bytes from 10.0.0.8: icmp_seq=34 ttl=64 time=12.8 ms
64 bytes from 10.0.0.8: icmp_seq=35 ttl=64 time=28.0 ms
64 bytes from 10.0.0.8: icmp_seq=36 ttl=64 time=30.9 ms
64 bytes from 10.0.0.8: icmp_seq=37 ttl=64 time=26.3 ms
64 bytes from 10.0.0.8: icmp_seq=38 ttl=64 time=18.4 ms
64 bytes from 10.0.0.8: icmp_seq=39 ttl=64 time=20.9 ms
64 bytes from 10.0.0.8: icmp_seq=40 ttl=64 time=25.1 ms
64 bytes from 10.0.0.8: icmp_seq=41 ttl=64 time=23.0 ms
64 bytes from 10.0.0.8: icmp_seq=42 ttl=64 time=14.2 ms
64 bytes from 10.0.0.8: icmp_seq=43 ttl=64 time=27.4 ms
64 bytes from 10.0.0.8: icmp_seq=44 ttl=64 time=17.6 ms
64 bytes from 10.0.0.8: icmp_seq=45 ttl=64 time=19.9 ms
64 bytes from 10.0.0.8: icmp_seq=46 ttl=64 time=17.4 ms
64 bytes from 10.0.0.8: icmp_seq=47 ttl=64 time=16.9 ms
64 bytes from 10.0.0.8: icmp_seq=48 ttl=64 time=19.9 ms
64 bytes from 10.0.0.8: icmp_seq=49 ttl=64 time=14.1 ms
64 bytes from 10.0.0.8: icmp_seq=50 ttl=64 time=28.3 ms
64 bytes from 10.0.0.8: icmp_seq=51 ttl=64 time=19.3 ms
64 bytes from 10.0.0.8: icmp_seq=52 ttl=64 time=15.5 ms
64 bytes from 10.0.0.8: icmp_seq=53 ttl=64 time=13.6 ms
64 bytes from 10.0.0.8: icmp_seq=54 ttl=64 time=16.6 ms
64 bytes from 10.0.0.8: icmp_seq=55 ttl=64 time=13.3 ms
64 bytes from 10.0.0.8: icmp_seq=56 ttl=64 time=28.0 ms
64 bytes from 10.0.0.8: icmp_seq=57 ttl=64 time=19.1 ms
64 bytes from 10.0.0.8: icmp_seq=58 ttl=64 time=28.4 ms
64 bytes from 10.0.0.8: icmp_seq=59 ttl=64 time=14.0 ms
64 bytes from 10.0.0.8: icmp_seq=60 ttl=64 time=30.8 ms
64 bytes from 10.0.0.8: icmp_seq=61 ttl=64 time=18.2 ms
64 bytes from 10.0.0.8: icmp_seq=62 ttl=64 time=28.8 ms
64 bytes from 10.0.0.8: icmp_seq=63 ttl=64 time=15.4 ms
64 bytes from 10.0.0.8: icmp_seq=64 ttl=64 time=18.7 ms
64 bytes from 10.0.0.8: icmp_seq=65 ttl=64 time=35.3 ms
64 bytes from 10.0.0.8: icmp_seq=66 ttl=64 time=31.5 ms
64 bytes from 10.0.0.8: icmp_seq=67 ttl=64 time=18.9 ms
64 bytes from 10.0.0.8: icmp_seq=68 ttl=64 time=17.2 ms
64 bytes from 10.0.0.8: icmp_seq=69 ttl=64 time=23.7 ms
64 bytes from 10.0.0.8: icmp_seq=70 ttl=64 time=30.9 ms
64 bytes from 10.0.0.8: icmp_seq=71 ttl=64 time=29.8 ms
64 bytes from 10.0.0.8: icmp_seq=72 ttl=64 time=14.8 ms
64 bytes from 10.0.0.8: icmp_seq=73 ttl=64 time=30.9 ms
64 bytes from 10.0.0.8: icmp_seq=74 ttl=64 time=8.01 ms
64 bytes from 10.0.0.8: icmp_seq=75 ttl=64 time=12.2 ms
64 bytes from 10.0.0.8: icmp_seq=76 ttl=64 time=13.7 ms
64 bytes from 10.0.0.8: icmp_seq=77 ttl=64 time=16.4 ms
64 bytes from 10.0.0.8: icmp_seq=78 ttl=64 time=18.9 ms
64 bytes from 10.0.0.8: icmp_seq=79 ttl=64 time=19.1 ms
64 bytes from 10.0.0.8: icmp_seq=80 ttl=64 time=146 ms
64 bytes from 10.0.0.8: icmp_seq=81 ttl=64 time=31.8 ms
64 bytes from 10.0.0.8: icmp_seq=82 ttl=64 time=29.7 ms
64 bytes from 10.0.0.8: icmp_seq=83 ttl=64 time=46.9 ms
64 bytes from 10.0.0.8: icmp_seq=84 ttl=64 time=27.0 ms
64 bytes from 10.0.0.8: icmp_seq=85 ttl=64 time=15.1 ms
64 bytes from 10.0.0.8: icmp_seq=86 ttl=64 time=42.8 ms
64 bytes from 10.0.0.8: icmp_seq=87 ttl=64 time=32.5 ms
64 bytes from 10.0.0.8: icmp_seq=88 ttl=64 time=19.9 ms
64 bytes from 10.0.0.8: icmp_seq=89 ttl=64 time=18.0 ms
64 bytes from 10.0.0.8: icmp_seq=90 ttl=64 time=7.97 ms
64 bytes from 10.0.0.8: icmp_seq=91 ttl=64 time=26.9 ms
64 bytes from 10.0.0.8: icmp_seq=92 ttl=64 time=40.0 ms
64 bytes from 10.0.0.8: icmp_seq=93 ttl=64 time=13.4 ms
64 bytes from 10.0.0.8: icmp_seq=94 ttl=64 time=17.9 ms
64 bytes from 10.0.0.8: icmp_seq=95 ttl=64 time=53.3 ms
64 bytes from 10.0.0.8: icmp_seq=96 ttl=64 time=33.2 ms
64 bytes from 10.0.0.8: icmp_seq=97 ttl=64 time=16.8 ms
64 bytes from 10.0.0.8: icmp_seq=98 ttl=64 time=19.2 ms
64 bytes from 10.0.0.8: icmp_seq=99 ttl=64 time=14.2 ms
64 bytes from 10.0.0.8: icmp_seq=100 ttl=64 time=18.0 ms

--- 10.0.0.8 ping statistics ---
100 packets transmitted, 100 received, 0% packet loss, time 99237ms
rtt min/avg/max/mdev = 7.965/23.327/145.602/15.520 ms


a. How long did it take (on average) to ping for each case?
For h1 ping h2 -> 4.888
For h1 ping h8 -> 23.327

b. What is the minimum and maximum ping you have observed?
Minimum:
For h1 ping h2 -> 1.793
For h1 ping h8 -> 7.965

Maximum:
For h1 ping h2 -> 23.124
For h1 ping h8 -> 145.602

c. Any difference from Task 2 and why do you think there is a change if there is?
Ans. 
Although the small difference, task 3's value for h1 ping h2 takes a little bit less
time than task 2's. For ping time numbers, the difference is significant because h1
and h8 require passing through significantly more switches. Since job 3 simply floods
the first few packets, it is clear that task 3 is significantly faster or has a reduced
ping time. After finding the target MAC address in the map, the switches will only resend
the packet to the port that corresponds to the "mac to port" mapping. But, the next pings
are a lot quicker because there won't be as much network congestion.

Q.3 Run “iperf h1 h2” and “iperf h1 h8”.
Ans. 
mininet> iperf h1 h2
*** Iperf: testing TCP bandwidth between h1 and h2
*** Results: ['9.79 Mbits/sec', '11.7 Mbits/sec']

mininet> iperf h1 h8
*** Iperf: testing TCP bandwidth between h1 and h8
*** Results: ['3.91 Mbits/sec', '4.29 Mbits/sec']


a. What is the throughput for each case?
Ans. 
For iperf h1 h2: Results: ['9.79 Mbits/sec', '11.7 Mbits/sec']
For iperf h1 h8: Results: ['3.91 Mbits/sec', '4.29 Mbits/sec']

b. What is the difference from Task 2 and why do you think there is a change if
there is?
Ans. For iperf h1 h2, task 3's throughput is higher than task 2's. Whereas for iperf h1 h8,
task 3's throughput is lower than task 2's. Because switches won't be overwhelmed and there
won't be a flood of packets once mac to port map has learned all the ports, there is less
network congestion than in Task 3 as a result. We can see in h1 and h2 that task 1 and 2
had throughput gains that were nearly three times as high as the average improvement
since the routes are more pre-computed and trained with changes in the controller.
The number of hops and dropped packets has decreased slightly but not significantly
for h1 and h8.

