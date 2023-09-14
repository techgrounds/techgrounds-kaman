# OMSCHRIJVING VAN EISEN

Netwerk en onderdelen:
- De volgende IP ranges worden gebruikt: 10.10.10.0/24 & 10.20.20.0/24
- Alle subnets moeten beschermd worden door een firewall op subnet niveau.


Webserver:
- De webserver moet op een geautomatiseerde manier geïnstalleerd worden.


Management Server:
- De admin/management server moet bereikbaar zijn met een publiek IP.
- De admin/management server moet alleen bereikbaar zijn van vertrouwde locaties (office/admin’s thuis)
- SSH of RDP verbindingen met de webserver mogen alleen tot stand komen vanuit de admin server.
- De managementserver moet toegang krijgen tot:
    - Webserver VM
    - Storage account
    - Key vault
    - Backup
    
Opslagoplossing voor scripts:
- Storage account voor bootstrap scripts.

Versleuteling:
- Alle VM disks moeten encrypted zijn.

Backup
- De webserver moet dagelijks gebackupt worden. De backups moeten 7 dagen behouden worden.

Keuzes:
- Kies een kosteneffectieve oplossing voor resourcekeuzes.
- Keuzes voldoen aan hoge beveiligingsvereisten en betrouwbaarheid.


MVP
- Documentatie voor het gebruik van de applicatie.
- MVP Deployment
