# Processes
Processen in Linux kunnen in drie hoofdcategorieën verdeeld worden: daemons, services en programma's.
- Daemons zijn achtergrondprocessen die automatisch opstarten bij het opstarten van het systeem, en die gewoonlijk geen interactie met de gebruiker hebben.
- Services zijn een speciaal soort daemon die luistert naar aanvragen en daarop reageert.
- Programs zijn meestal interactieve processen die door een gebruiker worden gestart en die in de voorgrond lopen.

## Key-terms
- daemon
- systemctl
- inetd of xinetd - xinetd daemon is a TCP wrapped super service which controls access to a subset of popular network services including FTP, IMAP, and Telnet


## Opdracht
### Gebruikte bronnen
Bronnen https://www.howtoforge.com/how-to-install-and-use-telnet-on-ubuntu/

### Ervaren problemen
Probleem: Telnet kon niet gestart worden met deze instructie `sudo systemctl start telnetd` Na wat uitzoeken kwam ik achter dat telnet binnen xinetd daemon zit en daarom xinetd moet starten.

Daarnaast kreeg ik de verwarring met xinetd en inetd. inetd is 'masked' en kon niet gestart worden. Waarschijnlijk omdat inetd oud en onveilig is en niet gewenst gebruikt te worden.


### Resultaat
Allereerst telnet geinstalleerd met `sudo apt install telnetd`   
telnet daemon gestart met `sudo systemctl start xinetd`

Vervolgens kun je met  `sudo ps aux | grep xinetd` de PID en het geheugengebruik van xinetd weergeven

![Image](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/LNX-06_screen02.PNG)

Stop de daemon met `sudo systemctl stop xinetd`


