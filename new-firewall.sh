#NEW RULES AGAINST L4 DdoS Attack
#created with love by Arlind Rexha

iptables -A INPUT -p tcp --dport 22 -m state --state NEW -m limit --limit 10/second --limit-burst 10 -j ACCEPT
#This will accept new TCP connections to port 22 at a rate of 10 connections per second, with a burst limit of 10 packets. Any packets that exceed this rate will be dropped.


#--------------------------------------------------
iptables -A INPUT -p icmp --icmp-type echo-request -m limit --limit 1/second -j ACCEPT
#This will accept incoming ICMP echo requests (ping) at a rate of 1 packet per second. Any packets that exceed this rate will be dropped.


#-------------------------------------------------
iptables -L -v -n | grep DROP
#This will display the number of packets dropped by each iptables rule.


#------------------------------------------------
# Limit TCP packets to ports 21, 22, and 80
iptables -A INPUT -p tcp --dport 21 -m state --state NEW -m limit --limit 10/second --limit-burst 10 -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -m state --state NEW -m limit --limit 10/second --limit-burst 10 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -m state --state NEW -m limit --limit 100/second --limit-burst 100 -j ACCEPT

# Limit UDP packets to ports 21, 22, and 80
iptables -A INPUT -p udp --dport 21 -m limit --limit 10/second --limit-burst 10 -j ACCEPT
iptables -A INPUT -p udp --dport 22 -m limit --limit 10/second --limit-burst 10 -j ACCEPT
iptables -A INPUT -p udp --dport 80 -m limit --limit 100/second --limit-burst 100 -j ACCEPT


#---------------------------------------------
iptables -A INPUT -p tcp --tcp-flags ALL ALL -j DROP
#This will drop any TCP packets with invalid flags.


#---------------------------------------------
iptables -A INPUT -p tcp --tcp-flags SYN,RST,ACK SYN -m length --length 59 -j DROP
#Block ip's which they send more than 59 length
