# Azure Global Infrastructure
Azure Global Infrastructure is het wereldwijde netwerk van Microsoft dat bestaat uit datacenters en netwerkverbindingen. Deze infrastructuur is ontworpen om een snelle, betrouwbare en veilige omgeving te bieden voor het uitvoeren van applicaties en opslaan van gegevens. Het stelt bedrijven in staat om hun digitale oplossingen op een schaalbare en flexibele manier te implementeren, ongeacht hun locatie.

## Key-terms
- Regions
- Availability Zones
- Region Pairs

## Opdracht
### Gebruikte bronnen
- ChatGTP
- https://learn.microsoft.com/en-us/azure/reliability/availability-zones-overview
- https://certifriedit.com/understanding-azure-regions/
- https://learn.microsoft.com/en-us/azure/reliability/cross-region-replication-azure


### Ervaren problemen
Ik heb gemerkt dat niet elke website de juiste informatie bevat.

### Resultaat

#### Azure Region
Azure heeft veel verschillende locaties over de hele wereld. Deze locaties worden "regio's" genoemd. Elke Azure-regio beschikt over datacenters die zijn ingezet binnen een omtrek die is gedefinieerd door latentie. Ze zijn met elkaar verbonden via een "dedicated regional low-latency network". Dit ontwerp zorgt ervoor dat Azure-services binnen elke regio de best mogelijke prestaties en beveiliging bieden.
Availabiliy zone-enabled regio's bevatten minimaal 3 Availabity zones.

#### Azure Availability Zone
Availability zones zijn unieke fysieke locaties binnen een regio. Elke zone bestaat uit een of meer datacenters.

Deze Availability Zone-datacenters werken onafhankelijk van andere Availability Zones binnen dezelfde regio. Ze hebben hun eigen stroomvoorziening, koeling en netwerken. 

Omdat elke Availability Zone onafhankelijk werkt en zijn eigen unieke infrastructuur heeft, is de kans groot dat als er één datacenter uitvalt, de andere datacenters in dezelfde regio dat niet doen.
Het gebruik van Availability Zones zijn optioneel en zijn niet in alle regio's beschikbaar.


#### Azure Region Pair
Een koppeling van twee Azure-regio's in hun eigen geografische gebied wordt een Region Pair genoemd. Een Azure-regio is gekoppeld aan een andere regio die zich tenminste 300 mijl van elkaar bevindt. Ze worden aan elkaar gekoppeld om onderbrekingen en schade door natuurrampen, netwerkstoringen en dergelijke te minimaliseren.

Ondanks dat de regio's met elkaar verbonden zijn, is er een bepaalde afstand tussen hen om te voorkomen dat problemen in de ene regio invloed hebben op de andere. Updates en nieuwe releases worden altijd één regio tegelijk uitgerold om een efficiënte workflow te waarborgen. Dit betekent dat als een regio in het paar te maken krijgt met downtime vanwege de updates, de andere regio alle taken kan overnemen.


#### Waarom zou je een regio boven een andere verkiezen?
 - Locatie - Je wilt misschien een regio kiezen die dicht bij je fysieke locatie of de locatie van je eindgebruikers ligt. Dit kan helpen om de latentie te verminderen, wat de snelheid en prestaties van je applicaties kan verbeteren.

 - Beschikbaarheid van diensten - Niet alle Azure-diensten zijn beschikbaar in alle regio's.

 - Wet- en regelgeving - Afhankelijk van de regio waarin je werkt kunnen er wettelijke of regelgevende vereisten zijn die bepalen waar je gegevens kunnen worden opgeslagen.

 - Prijs - De kosten van Azure-diensten kunnen variëren per regio. 

 - Availability zones - Niet alle regio's ondersteunen Availabity zones.