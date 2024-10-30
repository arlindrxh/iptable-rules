#RULES AGAINST L4 DdoS Attack
#created with love by Arlind Rexha

#--------------------------------------------------
iptables -A INPUT -p icmp --icmp-type echo-request -m limit --limit 1/s -j ACCEPT
#This rule limits incoming ping requests to 1 per second to prevent abuse and DdoS.


#--------------------------------------------------
iptables -A INPUT -p tcp --tcp-flags ALL ALL -m limit --limit 1/h -j ACCEPT
#This rule limits all TCP packets with all flags set at a rate of 1 per hour to prevent abuse.


#--------------------------------------------------
iptables -A INPUT -p tcp --tcp-flags ALL NONE -m limit --limit 1/h -j ACCEPT
#This rule helps to mitigate potential TCP SYN flood attacks by limiting the rate of packets.

 
#--------------------------------------------------
iptables -A INPUT -p tcp --syn -m limit --limit 2/s --limit-burst 30 -j ACCEPT
#This rule is designed to permit legitimate connection requests while protecting against SYN flood attacks by limiting the rate at which new TCP connections can be established.


#--------------------------------------------------
iptables -t mangle -A PREROUTING -p tcp ! --syn -m conntrack --ctstate NEW -j DROP
#This rule helps to prevent potential spoofing or connection hijacking attempts by rejecting any other types of packets that do not conform to the expected TCP handshake process for new connections.


#--------------------------------------------------
iptables -t mangle -A PREROUTING -m conntrack --ctstate INVALID -j DROP
#This rule targets packets that do not have a valid connection tracking state, which may indicate malformed packets, potential attacks, or unexpected traffic.


#--------------------------------------------------
