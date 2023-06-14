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
Had de 2e pagina van de opdracht met het voorbeeld niet gezien. Had daarom veel tijd besteedt aan het uittekenen van de hele netwerktopologie, terwijl het niet hoefde.

### Resultaat
#### Opdracht
Maak een netwerkarchitectuur die voldoet aan de volgende eisen:
1. private subnet dat alleen van binnen het LAN bereikbaar is. Dit subnet moet minimaal 15 hosts kunnen plaatsen.
2. private subnet dat internet toegang heeft via een NAT gateway. Dit subnet moet minimaal 30 hosts kunnen plaatsen (de 30 hosts is exclusief de NAT gateway).
3. public subnet met een internet gateway. Dit subnet moet minimaal 5 hosts kunnen plaatsen (de 5 hosts is exclusief de internet gateway).


#### Network: 10.0.0.0/24

#### Public subnet: 10.0.0.10/29

    Totale IP-adressen: 8
    Netwerkadres: 10.0.0.10
    Broadcastadres: 10.0.0.17
    Beschikbare hostadressen: 10.0.0.11 - 10.0.0.16 (6 hostadressen)

#### Private subnet met internettoegang (min. 30 hosts): 10.0.0.18/26

    Totale IP-adressen: 64
    Netwerkadres: 10.0.0.18
    Broadcastadres: 10.0.0.81
    Beschikbare hostadressen: 10.0.0.19 - 10.0.0.80 (62 hostadressen)
    
#### Private subnet (min. 15 hosts): 10.0.0.82/27

    Totale IP-adressen: 32
    Netwerkadres: 10.0.0.82
    Broadcastadres: 10.0.0.113
    Beschikbare hostadressen: 10.0.0.83 - 10.0.0.112 (30 hostadressen)


![Image](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/NWT-06_screen01.PNG)

![link](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/NWT-06_screen02.PNG)