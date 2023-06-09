# Firewalls
Azure Firewall is a managed, cloud-based network security service that protects your Azure Virtual Network resources. It's a fully stateful firewall as a service with built-in high availability and unrestricted cloud scalability, offering centralized network traffic filtering, routing controls, and protection against threats.

## Key-terms
- hub-and-spoke network
- Vnet
- L3-L7 filtering


The differences between Azure Firewall Basic/Standard/Premium:

![Image](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/AZ-08_image01.png)


**Azure Firewall Basic** - 
Azure Firewall Basic is designed for small and medium-sized businesses, offering essential protection at an affordable price, with limitations such as supporting only Threat Intel alert mode and recommended for environments with an estimated throughput of 250 Mbps

**Azure Firewall Standard**
Azure Firewall Standard provides L3-L7 filtering and threat intelligence feeds from Microsoft Cyber Security, alerting and denying traffic from known malicious IPs and domains in real time

**Azure Firewall Premium**
Azure Firewall Premium offers advanced capabilities including signature-based IDPS for rapid attack detection by looking for specific patterns in network traffic. These signatures are updated in real time to protect against new exploits.

**Firewall Policy vs. Firewall**:
In Azure, a Firewall is a network security service that protects your Azure Virtual Network resources. It's a fully stateful firewall as a service with built-in high availability and unrestricted cloud scalability.

A Firewall Policy is a global resource used to configure multiple Azure Firewall instances. It can work across regions and subscriptions, allowing for a centralized management experience using the Azure Firewall Manager. Policies contain rules (NAT, Network, Application rules, etc.) and settings (custom DNS, DNS proxy settings, IP Groups, Threat Intelligence settings, etc.) that can be applied to multiple firewalls, whereas classic rules are specific to a single firewall.

**NSG** - Network Security Group (NSG) is a more basic firewall that filters network traffic at the network layer (layer 4) and provides inbound and outbound security rules for individual resources.

Azure Firewall and Azure Network Security Group (NSG) often used together to provide additional layers of security for virtual networks. Azure Firewall can be used to filter application-level traffic while NSG can be used to filter network-level traffic (L4).



## Opdracht
### Gebruikte bronnen
- https://learn.microsoft.com/en-us/azure/firewall/overview
- https://learn.microsoft.com/en-us/azure/firewall-manager/policy-overview
- https://k21academy.com/microsoft-azure/az-500/azure-firewall-vs-nsg/#:~:text=An%20NSG%20is%20more%20targeted,with%20both%20firewalls%20and%20NSG.

### Ervaren problemen
Geen ervaren problemen.

### Resultaat

![Image](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/AZ-08_screen02.png)

No SSH connection possible:
![Image](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/AZ-08_screen03.png)