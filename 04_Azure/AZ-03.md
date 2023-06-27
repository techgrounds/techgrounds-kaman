# Advantages of the Cloud
The cloud offers significant benefits such as scalability, allowing businesses to adjust resources as per demand for cost efficiency​. Elasticity ensures automatic adjustment of resources based on utilization, optimizing operations​. The cloud also provides agility for rapid solution deployment​, and robust disaster recovery measures to minimize downtime and data loss

## Key-terms
Zie onder.

## Opdracht
### Gebruikte bronnen
- https://www.microsoftpressstore.com/articles/article.aspx?p=2979073
- https://bluexp.netapp.com/blog/azure-high-availability-basic-concepts-and-a-checklist
- https://vegibit.com/azure-high-scalability/
- https://azure.microsoft.com/en-us/resources/cloud-computing-dictionary/what-is-elastic-computing#:~:text=What%20is%20elastic%20computing%20or,and%20engineering%20for%20peak%20usage.
- https://learn.microsoft.com/en-us/answers/questions/1184630/difference-between-agility-and-elasticity
- https://www.proarch.com/blog/benefits-of-using-azure-site-recovery-for-disaster-recovery
- ChatGTP

### Ervaren problemen
Lots of reading. Used ChatGPt to make summaries of some of the articles.

### Resultaat

De zes voordelen van cloud computing zijn:

**High Availability**
    High Availability is a feature of systems and services designed to ensure a high level of operational performance, even in the event of partial failures. This means that the system is constantly operational or accessible and has minimal downtime. High Availability systems are typically designed to self-recover or automatically switch to a backup or standby mode in the event of a failure.

The key words in the concept of High Availability include:

- Reliability: The ability of the system to operate consistently and accurately.

- Redundancy: Having multiple components performing the same function to provide backup in case of failure.

- Fault Tolerance: The system's ability to recognize, isolate, and correct a failure without service interruption.

- Continuous Operation: The system should be designed to remain operational at all times.

- Automatic Recovery: The system's ability to recover automatically after a failure.

**Scalability**
Scalability refers to the ability of a system, network, or process to handle a growing amount of work, or its potential to accommodate growth. It's a critical aspect in cloud computing, like Azure, where resources need to be easily adjustable according to the demand.

There are two main types of scalability:

- Vertical scaling (Scaling Up): This involves upgrading to a bigger server to meet the demand placed on the cloud service. The upgraded server has bigger hard drives, a faster central processing unit, and more overall processing power. Vertical scaling can be thought of as adding or reducing the size of a virtual machine running in the cloud. It is a fantastic method to control costs as resources can be scaled down during slower usage times to save on costs. Conversely, resources can be scaled up during high-demand periods for short times to handle the increased load effectively and cost-efficiently​2​.

- Horizontal scaling (Scaling Out): This form of scaling comes into play when one has maxed out the available resources of the biggest server in vertical scaling. Horizontal scaling is accomplished by adding more servers of the same size, rather than upgrading to a bigger server. This allows the system to handle more traffic and increased computing demands

**Elasticity**
Elastic computing is the ability to quickly expand or decrease computer processing, memory, and storage resources to meet changing demands without worrying about capacity planning and engineering for peak usage. This can often be done automatically. The key feature of elasticity is that it allows for the efficient use of resources, ensuring that the system is not over-provisioned (wasting resources) or under-provisioned (leading to poor performance or service outages).

In other words, elasticity is about being able to match resources to demand, flexibly and rapidly. It's about the cloud system's ability to automatically adjust resources to maintain service performance and meet demand, reducing them when demand goes down, in a cost-effective way.

**Agility**
Agility is the speed and ease of allocating and deallocating resources. This allows for vast amounts of computing resources to be provisioned in a matter of minutes, making it easier for you to respond to changing business needs.

**Geo-distribution**
Distribution of applications and data across different geographical locations. This can improve service availability, provide better user experiences by reducing latency, and help comply with regional data regulations.
- Geo-redundancy: This is a method of data protection that involves storing copies of data in at least two geographically distant locations.

**Disaster recovery**
Refers to strategies and measures put in place to restore system functionality following a catastrophic event, such as system failures, cyber attacks, or natural disasters. It involves planning and processes that can help to restore the operations of an IT system. Azure offers a service known as Azure Site Recovery, which is a disaster recovery as a service (DRaaS) that helps in ensuring the applications remain available during outages or disruptions. It does this by orchestrating replication, failover, and recovery of workloads and applications so that they are available from a secondary location if the primary site is not available. One of the primary goals of disaster recovery planning is to minimize downtime and data loss

The key terms related to Disaster Recovery are:

- Fault Tolerance: The ability of a system to continue to function smoothly in the event of a failure of some of its components.
- Disaster Recovery Plan: The documented process or set of procedures to recover and protect a business IT infrastructure in the event of a disaster.
- Azure Site Recovery: A service by Azure that offers disaster recovery capabilities by orchestrating replication, failover, and the recovery of workloads and applications.
- Failover: The process of switching to a redundant or standby computer server, system, or network upon the failure or abnormal termination of the previously active server, system, or network.
- Replication: The process of copying and maintaining database objects, such as tables, in multiple databases that make up a distributed database system.


**Consumption based model**
The consumption-based model in cloud computing, also known as the pay-as-you-go rate, is a pricing option where you're charged only for what you use. This contrasts with the fixed price model, where you provision resources and are charged for those instances whether you use them or not.
The consumption-based model can be less efficient for estimating baseline costs when compared to the equivalent provisioned pricing with consistently high utilization, but it offers more flexibility. 
