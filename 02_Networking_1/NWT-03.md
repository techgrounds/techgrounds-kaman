# Protocols
Netwerkprotocollen zijn net als verkeersregels voor het internet. Ze vertellen computers en andere apparaten hoe ze met elkaar moeten "praten" of gegevens moeten uitwisselen.


## Key-terms
[Schrijf hier een lijst met belangrijke termen met eventueel een korte uitleg.]

## Opdracht
### Gebruikte bronnen
Mijn NWT-01 verslag

### Ervaren problemen
[Geef een korte beschrijving van de problemen waar je tegenaan bent gelopen met je gevonden oplossing.]

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

            * TCP
            * UDP
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
