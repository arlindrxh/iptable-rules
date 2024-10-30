#created with love by Arlind Rexha. - These rules will help you to drop incoming traffic with win 64240, 64320, 65535

#-----------------------------------------
iptables -A INPUT -p tcp --tcp-flags SYN,RST,ACK SYN -m u32 --u32 "4&0xFFFF=0xF940" -j DROP
0xF940 corresponds to window size 64240

#-----------------------------------------
iptables -A INPUT -p tcp --tcp-flags SYN,RST,ACK SYN -m u32 --u32 "4&0xFFFF=0xF998" -j DROP
0xF998 corresponds to window size 64320

#-----------------------------------------
iptables -A INPUT -p tcp --tcp-flags SYN,RST,ACK SYN -m u32 --u32 "4&0xFFFF=0xFFFF" -j DROP
0xFFFF corresponds to window size 65535

#-----------------------------------------
These rules will drop any incoming TCP SYN packet with a window size of 64240, 64320, or 65535.

#--------------------------------------------

!!!!!!!!!!!!!!!                  WARNING                    !!!!!!!!!!!!!!!!!!!

This article is for educational purposes only, the author is not responsible for their misuse by unauthorized persons.

best regards,
Arlind Rexha
