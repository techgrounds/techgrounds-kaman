# Identity and Access Management


## Key-terms
- IAM - Identity and Access Management
- Athentication
- Authorization
- MFA
- PoLP - Principle of least privilege

## Opdracht
### Gebruikte bronnen
- https://www.twilio.com/blog/authentication-vs-authorization
- https://www.cloudflare.com/learning/access-management/principle-of-least-privilege/
- https://www.globalknowledge.com/us-en/resources/resource-library/articles/the-three-types-of-multi-factor-authentication-mfa/
- https://www.upguard.com/blog/principle-of-least-privilege


### Ervaren problemen


### Resultaat
#### The difference between authentication and authorization.

Authenticatie is het valideren van de identiteit van een gebruiker voordat ze toegang krijgen tot een bepaald netwerk, systeem of account. Enkele veelvoorkomende vormen van authenticatie zijn:
- Basic authentication - Inloggen d.m.v. invoeren van username en password
- Multi-factor authentication - Meerdere keren bewijzen dat jij de persoon bent die probeert in te loggen. Bijvoorbeeld d.m.v. een PIN die naar je email is gestuurd of enkele beveiligingsvragen die alleen jij kunt beantwoorden.
 - Mobile authentication - Bijvoorbeeld inloggen met een PIN die naar je mobiel is gestuurd of door gebruik te maken van je biometrische gegevens.

 Bij Authorization authoriseer je het vermogen van een persoon om toegang te krijgen tot een specifieke bestand of bron. Authenticatie vereist actie van de gebruiker, maar bij autorisatie ligt de verantwoordelijkheid bij de server of site.

#### The three factors of authentication and how MFA improves security.

De drie factoren van authenticatie omvatten:

- Iets wat je weet (knowledge factor): Dit verwijst naar unieke informatie die alleen de gebruiker kent, zoals een wachtwoord, pincode of het antwoord op een beveiligingsvraag.

- Iets wat je hebt (possession factor): Dit is een fysiek item dat de gebruiker bezit. Voorbeelden hiervan zijn een mobiele telefoon voor het ontvangen van verificatiecodes, een bankpas of een beveiligingstoken.

- Iets wat je bent: Dit zijn de biometrische details van de gebruiker, zoals vingerafdrukken, gezichtsherkenning of retinascans.

Multi-factor authenticatie (MFA) verbetert de beveiliging door van de gebruiker te verlangen dat hij of zij twee of meer van deze factoren verstrekt om toegang te krijgen. Dit betekent dat als bijvoorbeeld je wachtwoord gelekt is, de account veilig blijft omdat de indringer niet over de andere benodigde factor(en) beschikt. Daarom biedt MFA een hoger beveiligingsniveau dan enkelvoudige authenticatie.

#### What the principle of least privilege is and how it improves security.

Het principe van minimale bevoegdheid (PoLP) is een beveiligingsconcept waarin een gebruiker alleen die privileges krijgt die absoluut noodzakelijk zijn voor zijn of haar werkfuncties. Dit betekent dat gebruikers, systemen en processen alleen de minimale toegangsrechten en privileges moeten hebben die nodig zijn om hun toegewezen taken uit te voeren.

 Bij IAM worden principes zoals van PoLP gevolgd om de toegangsrechten voor alle gebruikers te beperken.
 IAM is een framework van beleid en technologieën die ervoor zorgen dat de juiste mensen of systemen op het juiste moment toegang hebben tot de juiste middelen in een organisatie, en dat deze toegang op de juiste manier wordt gebruikt. 
 IAM gaat verder dan het principe van minimale bevoegdheid door ook te zorgen voor het identificeren, authenticeren en autoriseren van gebruikers.