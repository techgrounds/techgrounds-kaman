# Users and groups

In Linux zijn users en groeps belangrijke onderdelen voor de beveiliging en het beheer van systeembronnen. Users kunnen toegekend worden aan groups. In groups kunnen users georganiseerd worden met vergelijkbare rechten. Users in de 'sudo'-group zijn in staat commands met beheersrechten uit te voeren.

## Key-terms
- root
- commands
    - sudo
    - useradd of adduser
    - usermod -aG - *The -aG option tells the system to append the user to the specified group.*
    - passwd
- configuration files
    - /etc/passwd
    - /etc/group
    - /etc/shadow

## Opdracht
### Gebruikte bronnen
https://phoenixnap.com/kb/how-to-create-sudo-user-on-ubuntu

### Ervaren problemen
Ik moest opzoeken hoe een user in de sudo group toegevoegd kon worden. Verder geen problemen ondervonden.

### Resultaat

Met dit instructie kon ik een nieuwe user genaamd "superkaman" aanmaken:

```sudo useradd superkaman```

Met onderstaande instructie kon ik deze user toevoegen aan de sudo group.


```sudo usermod -aG sudo superkaman```


![Image](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/LNX-04_screen01.PNG)

Hiermee heb ik de password veranderd:

```sudo passwd superkaman```

Met de command `groups superkaman` kan ik zien of deze user in de sudo-group zit. Deze user bevindt zich in de sudo-group en is daarom in staat 'sudo' te gebruiken.

![Image](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/LNX-04_screen02.PNG)


Configuration files in Linux bevinden zich in /etc.

De user 'superkaman' staat in elk van de onderstaande configuratie bestanden

/etc/passwd - hierin staan alle users van dit systeem in.

![Image](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/LNX-04_screen03.PNG)

/etc/group - hierin staan de groups en de users die daarbij horen.

![Image](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/LNX-04_screen04.PNG)

/etc/shadow - in deze file staan de wachtwoorden in van users in hash-vorm.

![Image](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/LNX-04_screen05.PNG)