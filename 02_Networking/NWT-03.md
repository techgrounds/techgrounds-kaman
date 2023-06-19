# Protocols
Netwerkprotocollen zijn net als verkeersregels voor het internet. Ze vertellen computers en andere apparaten hoe ze met elkaar moeten "praten" of gegevens moeten uitwisselen.


## Key-terms
Protocols


## Opdracht
### Gebruikte bronnen
- Mijn NWT-01 verslag
- https://www.guru99.com/wireshark-passwords-sniffer.html
- https://www.fortinet.com/resources/cyberglossary/what-is-arp

### Ervaren problemen
Geen.

### Resultaat

#### Identify several other protocols and their associated OSI layer. Name at least one for each layer.

- Netwerkprotocollen per OSI layer:
    - Layer 1 Physical Layer: geen protocollen
    - Layer 2 Data link Layer: 

            * Ethernet - Ethernet wordt gebruikt voor lokaal netwerkverkeer.
            * Wi-Fi (IEEE 802.11) - wordt gebruikt voor draadloze netwerken.

    - Layer 3 Network Layer:

            * IP (Internet Protocol) - vormt de basis voor het internet zoals we dat kennen.
            * ICMP - wordt gebruikt door routers en switches om foutmeldingen en operationele informatie te verzenden en te ontvangen.
    - Layer 4 Transport Layer:

            * TCP -  TCP is een verbindingsgericht protocol dat een betrouwbare, geordende en foutgecontroleerde levering van data verzorgd.
            * UDP - UDP is eenvoudiger en sneller dan TCP. Het biedt geen garantie voor levering, behoud van volgorde, of foutcontrole.
    - Layer 5 Transport Layer:
    
            * SSH - zorgen een beveiligde sessie tussen een lokale en een externe host.
            * PPTP - wordt gebruikt om VPN-tunnels te creëren
    - Layer 6 Presentation Layer:

            * TLS - voor het beveiligen van webverkeer
            * JPEG - Dit beeldbestandsformaat bevat gegevenscodering en -compressie mechanismen die werken op de presentatielaag.

    - Layer 7 Application Layer:

            * HTTP - wordt gebruikt voor webverkeer
            * DNS  - verantwoordelijk voor het omzetten van domeinnamen in IP-adressen


#### Figure out who determines what protocols we use and what is needed to introduce your own protocol.

De protocollen die we in netwerken gebruiken, worden bepaald door standaardisatieorganisaties en industrieconsortia.
Enkele van deze instanties:
- Internationale Organisatie voor Standaardisatie (ISO)
- Internet Engineering Task Force (IETF)
- World Wide Web Consortium (W3C)

Voor het introduceren van je eigen protocol zou je het eerst zelf moeten ontwikkelen. Het protocol moet daarna uitgebreid worden getest en grondig moeten worden gedocumenteerd.
Vervolgens moet je anderen overtuigen het te gebruiken door het te promoten. Idealiter zou je ook nog willen dat je protocol wordt erkend door een standaardisatieorganisatie.

#### Look into wireshark and install this program. Try and capture a bit of your own network data. Search for a protocol you know and try to understand how it functions.

![Image](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/NWT-03_screen01.PNG)

De volgende protocollen zijn gevonden in de capture:
- **TCP (Transmission Control Protocol)** - een verbindingsgericht protocol dat een betrouwbare, geordende en foutgecontroleerde levering van data verzorgd.
- **UDP (User Datagram Protocol)** - eenvoudiger en sneller dan TCP. Het biedt geen garantie voor levering, behoud van volgorde, of foutcontrole.
- **TLSv1.2 (Transport Layer Security version 1.2)** - wordt meestal gebruikt voor een beveiligde verbinding met websites.
- **HTTP (Hypertext Transfer Protocol)** - HTTP wordt gebruikt voor webverkeer. 
- **ARP (Address Resolution Protocol)** - wordt gebruikt om een IP-adres te koppelen aan een fysiek (MAC) adres op een lokaal netwerk. De ARP-cache op elke computer op een IPv4 netwerk houdt een lijst bij van elk IP-adres en het bijbehorende MAC-adres.
- **QUIC (Quick UDP Internet Connections)** - een protocol ontwikkeld door Google en is ontworpen om sneller te zijn dan TCP en UDP.
- **SSDP (Simple Service Discovery Protocol)** - Dit is als een service die apparaten op een netwerk helpt elkaar te vinden en met elkaar te communiceren. (layer 7)