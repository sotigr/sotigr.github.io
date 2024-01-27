




connect to vpn:
sudo wg-quick up wg0




redirect trafic to home server
socat UDP-LISTEN:2456,fork UDP:10.66.66.2:2456