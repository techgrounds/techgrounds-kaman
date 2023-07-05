# Files, AppServices, CDN, DNS, Database

This assignment delves into the exploration and application of various Azure services, including file storage, App Services, Content Delivery Network (CDN), Domain Name System (DNS), and databases.


## Key-terms
**App Service**
Azure App Service is a Platform as a Service (PaaS) offering from Microsoft. It is used to host web applications, REST APIs, and backend services for mobile applications. It supports a wide variety of programming languages and frameworks, including .NET, .NET Core, Java, Ruby, Node.js, PHP, and Python.

With on-premises hosting, you or your organization is responsible for managing everything, including maintaining physical servers, storage, networking equipment, power supply, cooling systems, and installing and configuring software. In contrast, Azure App Service is a PaaS offering, meaning that Azure manages everything except your application and its data.
You dont have to worry about any of the things like:
- Managing the network or underlying infrastructure. 
- Installing the operating system updates, critical patches, runtime or middleware components.

Azure App directory can be combined with other services, for example:
- Authenticate users with Active Directory, Google, Facebook, etc.
- Access you on-premises servers using Hybrid Connections an Azure Virtual Network.
- Using hundreds of connectors available to connect with services like Salesforce, Facebook, etc.
- Setup continuous integration en deployment (CI/CD) with Azure DevOps, GitHub, BitBucket,Docker Hub, etc.

The differences between Azure App Service and similar services:
- Global scale with high availability - Scale up or out manually or automatically. You apps are hosted in Microsoft's global datacenter infrastructure, and the App Service SLA promises high availability.
- You work in a fully managed production environment, support for multiple programming languages and frameworks, scalability and security features. It also supports containerization and Docker, allowing you to host custom Windows or Linux containers in App Service.

**Content Delivery Network (CDN)**
Azure Content Delivery Network (CDN) is a network of distributed servers designed to cache and store content that can be accessed by computers globally. The purpose of Azure CDN is to minimize the geographical distance between a website user and the server hosting the site, which can significantly contribute to latency. Azure CDN servers are located close to end users to reduce latency.

 ![Image](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/AZ-13_image01.png)

Azure CDN is particularly useful for technologies that employ many large static files, like photographic images or videos. It is most useful where you need the ability to serve files to a large number of simultaneous users worldwide. If the content was more dynamic Azure CDN wouldn't offer significant advantages.


**Azure DNS**
**Azure Files**
**Azure Database**

## Opdracht
### Gebruikte bronnen
- https://www.pragimtech.com/blog/azure/what-is-azure-app-service/
- https://learn.microsoft.com/en-us/azure/app-service/overview
- https://learn.microsoft.com/en-us/training/modules/introduction-to-azure-files/
- https://learn.microsoft.com/en-us/training/modules/intro-to-azure-content-delivery-network/
- https://learn.microsoft.com/en-us/training/modules/azure-database-fundamentals/
- ChatGPT



### Ervaren problemen
[Geef een korte beschrijving van de problemen waar je tegenaan bent gelopen met je gevonden oplossing.]

### Resultaat
Bestudeer:
App Service			
Content Delivery Network (CDN)
Azure DNS
