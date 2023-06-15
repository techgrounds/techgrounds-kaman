# Networking case study

In this case study you take the role of a network administrator setting up a network in the new office of a small e-commerce company. Of course there are multiple ways to go about this problem, but this company has specifically said that network security is extremely important to them.
The office contains the following devices:
- A web server where our webshop is hosted
- A database with login credentials for users on the webshop
- 5 workstations for the office workers
- A printer
- An AD server
- A file server containing internal documents

As a network administrator you get to choose which networking devices get used.


## Key-terms
- Network security
- Network administrator
- Firewall
- DMZ
- AD server (Active Directory Server)

## Opdracht
### Gebruikte bronnen
- https://www.youtube.com/watch?v=xB7koECwqC0
- https://medium.com/@nakah_/recommended-design-for-a-secure-network-architecture-15612e17ece4
- ChatGPT

### Ervaren problemen
Er is geen 1 juiste manier om netwerken te ontwerpen. Het ontwerp van de Youtube video vond ik het meest geschikt voor deze study case. Daarom heb ik deze als basis gebruikt en verder uitgewerkt.

### Resultaat

![Image](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/NWT-07_screen02.png)

#### DMZ: Webserver + credential database
De webserver heb ik in de DMZ geplaatst.
 Deze moet van buitenaf toegankelijk moeten zijn (voor klanten die de webshop bezoeken), maar die je toch zoveel mogelijk wilt afschermen van de rest van het interne netwerk voor beveiligingsdoeleinden. De webserver in de DMZ kan dan communiceren met de credential database via een beveiligde verbinding.

 #### Internet firewall
 Deze firewall is verbonden met de DMZ en de router en controleert en filtert het dataverkeer van en naar het internet.

 #### Router
  De router verbindt het interne netwerk (via de switch) en de internet firewall. Dit apparaat is verantwoordelijk voor het routeren van verkeer en het verstrekken van IP-adressen aan de apparaten in het interne netwerk via DHCP.

 #### Internal Network
 In het interne netwerk zijn 5 workstations en de printer verbonden aan een switch. 
 De AD server zou ook in dit netwerk kunnen staan want het moet makkelijk toegankelijk zijn voor de apparaten en gebruikers die verificatie en autorisatiediensten nodig hebben in het windows-domein. Echter, vanwege de extra nadruk op beveiliging in deze casus, heb ik gekozen om de AD server achter een firewall te plaatsen.
 
#### Internal Firewall
 Deze firewall isoleert de AD-server en de file server van het interne netwerk. Deze set-up zorgt voor extra beveiliging voor deze kritieke systemen. 
 Als een systeem in het interne netwerk "compromised" is, zal het veel moeilijker voor de attacker zijn om toegang te krijgen tot de interne servers.

 #### AD Server, file Server en credential database
 Deze servers zijn verbonden met de interne firewall en zijn afgeschermd van het interne netwerk.

