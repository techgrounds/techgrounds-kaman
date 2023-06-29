# Azure Virtual Network (VNet)
Azure Virtual Networks (VNets) are the fundamental building block for private networking in Azure, allowing secure communication among Azure resources, the internet, and on-premises networks. They handle network isolation, traffic routing and filtering, and enable connectivity with on-premises resources via various methods including VPNs and Azure ExpressRoute

## Key-terms
- VNet
- Point-to-site VPN
- Site-to-site VPN
- Azure Expressroute
- virtual network peering
- user-defined Routing (UDR)
- Network Security Group (NSG)


## Opdracht

### Gebruikte bronnen
- https://learn.microsoft.com/en-us/azure/virtual-network/virtual-networks-overview
- https://www.thatlazyadmin.com/2022/04/04/block-internet-access-on-azure-vm-using-nsg-network-security-group/
- https://asifwaquar.com/how-to-block-the-internet-in-vm-using-custom-defined-routes/
- https://www.youtube.com/watch?v=7mn8WDoAMJU

### Ervaren problemen
Ik heb een ander ip-range aangemaakt dan wat in de opdracht staat omdat deze al in gebruik is genomen door een Peer.
De website bleef bereikbaar vanaf het internet ook al heb ik alles geblokkeerd. Dit zorgde voor verwarring. Bleek dat de browser zijn cache liet zien. In incognito werken is de oplossing.
Probeerde internet toegang te blokkeren dmv. routing tables. Maar dat lukte niet. Zal het later nog eens naar kijken.

### Resultaat
Een Virtual Network (10.2.0.0/16) aangemaakt met 2 subnets:
- Subnet-1
    - IP range: 10.2.0.0/16
- Subnet-2
    - IP range: 10.2.1.0/24

#### Subnet-1 mag geen route naar het internet hebben.
Een nieuwe NSG aangemaakt met onderstaande security rules voor inbound en outbound verkeer en vervolgens gekoppeld aan Subnet-1:

![Image](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/AZ-10_screen02.png)

Beide subnets en NSG.
![Image](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/AZ-10_screen03.png)


#### VM in Subnet-1
Daarna een VM aangemaakt met Apache webserver geinstalleerd.
VM in subnet-1 gezet. 
De Webserver is niet bereikbaar vanaf het internet. Zie de security rules:

![Image](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/AZ-10_screen04.png)


#### VM in Subnet-2:
In Subnet-2 is de VM wel bereikbaar vanaf het internet. De VM gebruikt de Security Groep die samen aangemaakt werd met de VM, deze geeft wel toegang tot het internet. Zie de security rules:

![Image](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/AZ-10_screen05.png)
