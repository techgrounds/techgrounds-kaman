# SSH remote connection
De opdracht is een verbinding opzetten met een reeds aangemaakte container op een ubuntu server VM gehost op AWS door middel van een ssh verbinding.

## Key-terms
- **SSH** - Secure Shell, een protocol dat wordt gebruikt om beveiligde verbinding te maken met een remote server.
- **Openssh**
- **CLI** - command line interface

## Opdracht
### Gebruikte bronnen
https://learn.microsoft.com/en-us/windows-server/administration/openssh/openssh_install_firstuse?tabs=gui
https://varunsaklani.wordpress.com/2022/04/13/how-to-ssh-from-windows-to-linux-using-pem-file/


### Ervaren problemen
Ik kreeg al snel de melding "permission denied". Door te googlen heb ik kunnen vinden hoe de key file en de poort nummer toegevoegd kan worden aan de prompt voor Openssh.

### Resultaat
Het is gelukt om de verbinding te maken in Powershell met Openssh. Zie output:
```whoami```

![LNX-01 screenshot](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/LNX-01_screenshot.PNG)
