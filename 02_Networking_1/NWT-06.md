# Subnetting

Subnetting is een methode om een IP-netwerk in kleinere stukken, of subnets, te verdelen. Het doel van subnetting is om het netwerkverkeer efficiënter te beheren, de prestaties te verbeteren en de beveiliging te verhogen.

Elk apparaat dat verbonden is met een netwerk, zoals een computer of een telefoon, heeft een IP-adres nodig. Een IP-adres bestaat uit twee delen: het netwerkdeel en het hostdeel. Het netwerkdeel identificeert het specifieke netwerk waarop het apparaat zich bevindt, en het hostdeel identificeert het specifieke apparaat binnen dat netwerk.

Subnetting werkt door extra bits van het hostdeel van het IP-adres te nemen en ze te gebruiken voor het netwerkdeel. Dit creëert extra "subnetten" binnen het oorspronkelijke netwerk, elk met zijn eigen reeks IP-adressen.

## Key-terms
CIDR
Subnet
NAT
Internet Gateway
Router/switches

## Opdracht
### Gebruikte bronnen
- De hele 'Network Chuck' subnetting series.
    [Youtube link](https://www.youtube.com/watch?v=B1vqKQIPxr0&list=PLIhvC56v63IKrRHh3gvZZBAGvsvOhwrRF&index=7)
- https://dnsmadeeasy.com/support/subnet
- ChatGPT


### Ervaren problemen


### Resultaat
#### Opdracht
Maak een netwerkarchitectuur die voldoet aan de volgende eisen:
1. private subnet dat alleen van binnen het LAN bereikbaar is. Dit subnet moet minimaal 15 hosts kunnen plaatsen.
2. private subnet dat internet toegang heeft via een NAT gateway. Dit subnet moet minimaal 30 hosts kunnen plaatsen (de 30 hosts is exclusief de NAT gateway).
3. public subnet met een internet gateway. Dit subnet moet minimaal 5 hosts kunnen plaatsen (de 5 hosts is exclusief de internet gateway).

#### Public subnet: 192.168.1.0/29

    Totale IP-adressen: 8
    Netwerkadres: 192.168.1.0
    Broadcastadres: 192.168.1.7
    Beschikbare hostadressen: 192.168.1.1 - 192.168.1.6 (6 hostadressen)

#### Private subnet (min. 15 hosts): 192.168.1.9/27

    Totale IP-adressen: 32
    Netwerkadres: 192.168.1.8
    Broadcastadres: 192.168.1.39
    Beschikbare hostadressen: 192.168.1.9 - 192.168.1.38 (30 beschikbare hostadressen)

#### Private subnet met internettoegang (min. 30): 192.168.1.40/26

    Totale IP-adressen: 64
    Netwerkadres: 192.168.1.40
    Broadcastadres: 192.168.1.103
    Beschikbare hostadressen: 192.168.1.41 - 192.168.1.102  (62 hostadressen)

In de router moet de routetable zo geconfigureerd zodat internetverkeer vanuit de public subnet door kan worden gegeven aan de Internet Gateway.


![Image](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/NWT-06_screen01.PNG)