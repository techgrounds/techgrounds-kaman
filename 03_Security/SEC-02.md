# Firewalls
Een firewall is als een bewaker voor je computer of netwerk. Het kijkt naar al het verkeer dat binnenkomt en naar buiten gaat en beslist wat door mag gaan en wat moet worden gestopt. Het is ontworpen om je computer te beschermen tegen dingen zoals virussen of aanvallen van hackers. Je kunt het zien als een soort filter dat ervoor zorgt dat alleen veilige en toegestane dingen jouw computer of netwerk kunnen bereiken.

## Key-terms
- UFW - Uncomplicated Firewall
- stateless firewall
   - De belangrijkste eigenschap van een stateless firewall is dat elk ontvangen pakket onafhankelijk wordt verwerkt. 
- stateless firewall
    - Bij stateful firewalls worden resultaten van eerdere verwerking van pakketten of verbindingsdetails in overweging genomen bij het handelen over een specifiek inkomend of uitgaand pakket.
- hardware firewall - Het is een fysiek stuk apparatuur dat is ontworpen om firewalltaken uit te voeren. Een hardware firewall kan een computer zijn of een speciaal stuk apparatuur dat fungeert als een firewall.  Meestal bevindt deze tussen de devices en de internetgateway.
- software firewall - een firewall sorfware dat draait op een computer of server. Het hoofddoel is om je computer of server te beschermen tegen pogingen van buitenaf om controle te krijgen of toegang te verkrijgen.

## Opdracht
### Gebruikte bronnen
- https://www.cyberciti.biz/faq/how-to-configure-firewall-with-ufw-on-ubuntu-20-04-lts/
- https://www.baeldung.com/cs/firewalls-stateless-vs-stateful
- https://www.geeksforgeeks.org/difference-between-hardware-firewall-and-software-firewall/

### Ervaren problemen
Geen.

### Resultaat
De standaardpagina van Apache op de VM:
![Image](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/SEC-02_screen01.png)


#### Stel de firewall zo in dat je webverkeer blokkeert, maar wel ssh-verkeer toelaat. Controleer of de firewall zijn werk doet.

HTTP verbindingen gaan via poort 80. In de firewall moet een regel toegevoegd worden om poort 80 te blokkeren.

Check de status van de firewall:
`sudo ufw status`
Output:
`Status: inactive`

De volgende regels zijn voor het blokkeren van alle inkomende en uitgaande verbindingen. Daarna worden alleen de poorten open gesteld die je wilt toelaten.
```
sudo ufw default allow outgoing
sudo ufw default deny incoming
```

Open poort 22 voor ssh:
```sudo ufw allow ssh```


Vervolgens de firewall geactiveerd met:
`sudo ufw enable`


Status: `sudo ufw status verbose` 

![Image](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/SEC-02_screen02.png)


Resultaat: de webpagina is niet meer bereikbaar in de browser.
