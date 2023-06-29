# [Onderwerp]
The shared responsibility model is a cloud security framework that outlines cloud providers' and customers' security obligations and responsibilities for ensuring accountability. In this arrangement, cloud providers are responsible **for** the security of the cloud, while customers handle the security **in** the cloud.

## Key-terms
- SaaS - Software as a service
- PaaS - Platform as a service
- IaaS - Infrastructure as a service 
- On-prem - refers to IT infrastructure hardware and software applications that are hosted on-site.

## Opdracht
### Gebruikte bronnen
- https://learn.microsoft.com/en-us/azure/security/fundamentals/shared-responsibility
- https://www.corestack.io/azure-security-tools/azure-shared-responsibility-model/
ChatGPT

### Ervaren problemen
Geen problemen ervaren.

### Resultaat

**Shared Responsibility Model**
The shared responsibility model is a cloud security framework that outlines cloud providers' and customers' security obligations and responsibilities for ensuring accountability. In this arrangement, cloud providers are responsible for the security of the cloud, while customers handle the security in the cloud.

![Image](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/AZ-04_image.svg)


**You’ll always be responsible for:**

- The information and data stored in the cloud
- Devices that are allowed to connect to your cloud (cell phones, computers, and so on)
- The accounts and identities of the people, services, and devices within your organization

**The cloud provider is always responsible for:**

- The physical datacenter
- The physical network
- The physical hosts

**Your service model will determine responsibility for things like:**

- Operating systems
- Network controls
- Applications
- Identity and infrastructure


####List of responsibilities:

- Information and data: This involves classifying, securing, and managing data. It includes tasks such as encrypting sensitive data, ensuring regulatory compliance, backing up data, and managing data access permissions.

- Devices (Mobile and PC's): Refers to securing all devices that are used to access the services or data. This may include installing antivirus software, regularly updating device software, enabling firewalls, and managing device access permissions.

- Accounts and identities: This involves managing user accounts and their associated identities. Tasks might include setting up strong password policies, implementing multi-factor authentication, monitoring for suspicious activities, and managing user access permissions.

- Identity and directory infrastructure: This responsibility includes managing the structure of resources and user identities within a directory. It involves setting up and maintaining identity management systems, like Active Directory, to control access to resources.

- Applications: This refers to securing all applications that are being used. It involves patching and updating applications, protecting against malware and other threats, and securing application data.

- Network Controls: This involves managing and securing network access. Tasks might include setting up firewalls, monitoring network traffic, securing Wi-Fi networks, and managing network access controls.

- Operating system: This involves managing and securing the operating system(s) in use. It includes tasks such as regularly installing updates and patches, hardening the operating system, and monitoring for threats.

- Physical host: This refers to securing the physical servers where data and applications are hosted. It involves tasks like securing access to server rooms, maintaining hardware, and monitoring for physical threats.

- Physical network: This involves securing the physical infrastructure that supports network connectivity. This may include securing network equipment rooms, maintaining network hardware, and managing physical network access controls.

- Physical datacenter: This responsibility involves securing the physical location where servers, network equipment, and other infrastructure are housed. Tasks might include implementing physical access controls, maintaining environmental controls (like cooling systems), and monitoring for physical security threats.