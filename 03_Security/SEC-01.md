# Network detection
Netwerkdetectie is als een landkaart maken van alle computers en andere apparaten die verbonden zijn met een netwerk. 
Met een tool als Nmap kunnen we de poorten controleren van systemen op het netwerk. Door te kijken welke poorten open zijn, kan Nmap ons vertellen welke diensten een apparaat uitvoert. Dit kan ons helpen kwetsbaarheden in een netwerk op te sporen.

## Key-terms
- nmap
- port scanner
- 3-way handshake


## Opdracht
### Gebruikte bronnen
https://www.educba.com/kali-linux-nmap/
https://www.geeksforgeeks.org/tcp-3-way-handshake-process/

### Ervaren problemen
Geen.

### Resultaat
#### nmap
`nmap 10.105.175.0/24`
arguments:

![Image](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/SEC-01_screen01.png)

Wanneer ik mijn browser open met veel openstaande tabs zie ik het volgende:
1. DNS - DNS requests worden gedaan om de ipadressen op te halen van alle websites in de tabs.
![Image](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/SEC-01_screen02.png)
2. TLSv1.3 - Daarna worden beveiligde verbindingen (HTTPS) opgezet met de websites. 3-way handshakes (SYN, Syn-Ack, Ack) worden gemaakt.
![Image](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/SEC-01_screen03.png)
3. TCP - Daarna zie je dat TCP verbindingen worden opgezet.Ook 3-way handshakes worden gemaakt. 
![Image](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/SEC-01_screen04.png)
4. QUIC - Ook zie je nu dat QUIC verbindingen al zijn opgezet. Dit protocol wordt gebruikt door Google diensten.


