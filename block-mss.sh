#created with love by Arlind Rexha. - These rules helps you to block 3way Handshake TCP-METHODS.

#----------------------------------------------
iptables -A INPUT -p tcp --sport 1024: --tcp-flags SYN,RST,ACK SYN -m u32 --u32 "12&0xFF00=0x05B4" -j DROP
0x05B4 corresponds to MSS 1480

#----------------------------------------------
iptables -A INPUT -p tcp --sport 1024: --tcp-flags SYN,RST,ACK SYN -m u32 --u32 "12&0xFF00=0x05A8" -j DROP
0x05A8 corresponds to MSS 1460

#----------------------------------------------
iptables -A INPUT -p tcp --sport 1024: --tcp-flags SYN,RST,ACK SYN -m u32 --u32 "12&0xFF00=0x0588" -j DROP
0x0588 corresponds to MSS 1440

#----------------------------------------------
iptables -A INPUT -p tcp --sport 1024: --tcp-flags SYN,RST,ACK SYN -m u32 --u32 "12&0xFF00=0x0568" -j DROP
0x0568 corresponds to MSS 1420

#----------------------------------------------
iptables -A INPUT -p tcp --sport 1024: --tcp-flags SYN,RST,ACK SYN -m u32 --u32 "12&0xFF00=0x0548" -j DROP
0x0548 corresponds to MSS 1400

#----------------------------------------------
iptables -A INPUT -p tcp --sport 1024: --tcp-flags SYN,RST,ACK SYN -m u32 --u32 "12&0xFF00=0x0528" -j DROP
0x0528 corresponds to MSS 1380


#----------------------------------------------
These rules will drop any incoming TCP SYN packet with an MSS value of 1480, 1460, 1440, 1420, 1400, or 1380.

#--------------------------------------------

!!!!!!!!!!!!!!!                  WARNING                    !!!!!!!!!!!!!!!!!!!

This article is for educational purposes only, the author is not responsible for their misuse by unauthorized persons.

best regards,
Arlind Rexha
