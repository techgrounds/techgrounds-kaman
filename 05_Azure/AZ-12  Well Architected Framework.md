# Well-Architected Framework
The Azure Well-Architected Framework is a set of guiding tenets that you can use to improve the quality of a workload. The framework consists of five pillars of architectural excellence:

- Reliability
- Security
- Cost optimization
- Operational excellence
- Performance efficiency

Incorporating these pillars helps produce a high quality, stable, and efficient cloud architecture.

## Key-terms"
The 5 Pillars (CROPS):

**Cost optimization**
Managing costs to maximize the value delivered.

- Plan and estimate costs.
- Provisioning with optimization - This includes selecting the appropriate service level for your workload, taking advantage of services that let you adjust the service level, and using discounts when available.
- Use monitoring and analytics to gain cost insights.
- Identify and eliminate unnecessary expenses within your environment.


**Reliability**
The ability of a system to recover from failures and continue to function.

- Build a highly available architecture: Make sure your application can keep working even when one part of it fails. This is done by adding redundancy, which means having backup components ready to take over if the main ones fails.
- Build an architecture that can recover from failure: Plan for how your application will recover if there is a major problem, like a big data loss or a long period of downtime. This involves figuring out what your recovery strategies are and how much they will cost. You should also define your Recovery Point Objective (RPO, the maximum amount of data you can afford to lose) and Recovery Time Objective (RTO, the maximum amount of time you can afford for your application to be down).
   

**Operational excellence**
Operational excellence is about ensuring full visibility into how your application is running and ensuring the best experience for your users. It includes making your development and release practices more agile, allowing your business to quickly adjust to changes.

- Design, build, and orchestrate with modern practices, such as DevOps
- Use monitoring and analytics to gain operational insights. This helps you identify when something isn't right before your users are affected.
- Use automation to reduce effort and error.

**Performance efficiency**
The ability of a system to adapt to changes in load.

- Scale up and scale out
- Autoscaling
- Optimize network performance by selecting the right networking and storage technologies for your architecture.
- Optimize storage performance - partitioning, caching 
- Identify performance bottlenecks in your application.

**Security**
Protecting applications and data from threats.
 - Making sure the systems where the data is stored and the people who can access it are also secure.
- Defense in depth:
    ![Image](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/AZ-12_image01.png)


## Opdracht
### Gebruikte bronnen
- https://learn.microsoft.com/en-us/azure/well-architected/
- https://learn.microsoft.com/en-us/training/modules/azure-well-architected-introduction/
- ChatGPT

### Ervaren problemen
Het is veel lezen maar geen problemen tegen gekomen.

### Resultaat

Here is how each pillar of the Well-Architected Framework can be implemented using cloud services:

#### Cost
The Azure Cost Management tools, can assist you in managing and optimizing cloud costs. By gaining visibilty into your usage and costs.

#### Reliability
Make use of services such as autoscaling, backups, and disaster recovery, Availability Zones to increase reliability.

#### Operational Excellence
Azure Monitor assists you in automating tasks. It helps you understand how your applications are performing, so you can respond to changes, and continuously improve processes. 

Azure DevOps support teams to plan work, collaborate on code development, and build and deploy applications efficiently.

Azure Automation allows you to automate frequently/time-consuming tasks.

Azure Advisor is a personalized cloud consultant that helps you follow best practices to optimize your Azure deployments.

#### Performance
Autoscaling and Load Balancer services.
By automatically adjusting the amount of computational resources based on the actual demand and distributing network traffic across multiple servers or instances,ensures that no single server becomes a bottleneck

Azure Application Insights can help you pinpoint bottlenecks in your system. 
For instance, a particular service that's slow in responding or a find component that can not keep up with the demand.

#### Security

Azure Active Directory - IAM, to ensure only authorized 
individuals have access to your resources.

Network Security: Azure Firewall, Azure DDoS Protection

Data Encryption: SSL/TLS. Azure Disk Encryption
Azure Security Center 


