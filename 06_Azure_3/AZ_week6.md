# Onderwerpen Cloud Fundamentals Week 6
- Containers				
- Azure Support Plans				
- Azure Advisor			
- Azure App Configuration	
- Azure Activity Log

- Azure Active Directory	
- Azure Monitor					
- CosmosDB
- Azure Functions
- Event Grid, Queue Storage, Service Bus


## Key-terms
**Containers**
Containers are lightweight packages of your application code together with dependencies such as specific versions of programming language runtimes and libraries required to run your software services.

Benefits:
- Separation of responsibility
- Workload portability
- Application isolation

Container VS. VMs:
- Containers are much more lightweight than VMs.
- Containers virtualize at the OS level while VMs virtualize at the hardware level.
- Containers share the OS kernel and use a fraction of the memory VMs require.

Azure offers several container options:
- Azure Container Apps - A serverless container service that's designed for running microservices.
- Azure App Service - Fully managed hosting for web applications including websites and web APIs. 
- Azure Container Instances (ACI) - Good for simple, isolated container deployments. 'low-level' therefore does not have features like autoscaling, service discovery, orchestrated upgrades.
- Azure Kubernetes Service (AKS) - a fully managed Kubernetes service that provides more advanced features like service discovery across multiple containers, automatic scaling, and orchestrated application upgrades.
- Azure Functions -  A serverless Functions-as-a-Service (FaaS) solution. It's optimized for running event-driven applications using the functions programming model.
- Azure Spring Apps - A fully managed service for Spring developers. 
- Azure Red Hat OpenShift - Azure Red Hat OpenShift is jointly engineered, operated, and supported by Red Hat and Microsoft.

**Azure Support Plans**
Microsoft offers four support plans that can provide you with technical support:

- Basic: Available to all Microsoft Azure accounts, this is the only free plan and does not have any active support from Azure. The user has access to community forums, self-help documentation, etc., and can raise as many support tickets as required.

- Developer: Best suggested for trial and non-production environments. This plan has active support from Azure in the form of access to support engineers via email during standard business hours. The response time from Microsoft for this plan is within eight hours.

- Standard: Best suggested for production workload environments, this plan is an upgrade of the developer plan and provides support in the form of 24x7 access to support engineers via email and phone. The response time from Microsoft for this plan is within one hour.

- Professional Direct: For business-critical environments, this plan also offers 24/7 technical support with a one-hour response time but also includes operational support, training, and proactive guidance from a ProDirect delivery manager.

**Azure Advisor**
Advisor is a personalized cloud consultant that helps you follow best practices (CROPS) to optimize your Azure deployments. It analyzes your resource configuration and usage telemetry and then recommends solutions that can help you improve the cost effectiveness, performance, high availability, and security of your Azure resources.


**Azure App Configuration**
Azure App Configuration is an Azure service that allows users to manage configuration within the cloud. Users can create App Configuration stores to store key-value settings and consume stored settings from applications, build pipelines, release processes, microservices, and other Azure resources.

This is especially useful for complex applications that run in different places (like multiple virtual machines or containers) or use multiple external services. Instead of having settings scattered across all these different places, you can keep them all in one place with Azure App Configuration.

It also allows you to change settings without needing to restart or redeploy your application, and it can help you manage feature flags, which are a way to turn certain features in your application on or off in real-time.

Microsoft provides libraries to connect your application to Azure App Configuration, depending on the programming language and framework you're using.

**Azure Activity Log**
The Azure Monitor Activity Log is a tool that records all the things happening in your Azure account at subscription level.
You can view this log directly in the Azure portal, or you can use tools like PowerShell or the Azure Command Line Interface (CLI) to retrieve entries.

The log entries has an retention periode of 90 days, but if you need to keep them for longer, you can send them to other places like Azure Monitor Logs, Azure Event Hubs, or Azure Storage.


## Opdracht
### Gebruikte bronnen
[Support plans 1](https://azure.microsoft.com/en-us/support/plans) 
[Support Plans 2](https://k21academy.com/microsoft-azure/az-900/az-900-azure-support-options/)
[Containers](https://cloud.google.com/learn/what-are-containers#:~:text=Containers%20are%20packages%20of%20software,on%20a%20developer's%20personal%20laptop.)
[Azure Container Instances](https://learn.microsoft.com/nl-nl/azure/container-instances/container-instances-overview)
[Azure container options](https://learn.microsoft.com/en-us/azure/container-apps/compare-options)
[Azure App Configuration](https://github.com/Azure/AppConfiguration)
[Azure activity log](https://learn.microsoft.com/en-us/azure/azure-monitor/essentials/activity-log?tabs=powershell)
[Cosmos DB](https://www.infoq.com/articles/Cosmos-DB-Tutorial/)
[Cosmos-DB](https://www.youtube.com/watch?v=R_Fi59j6BMo)
[Even Grid](https://www.serverless360.com/azure-event-grid)
[Azure Service Bus](https://hevodata.com/learn/azure-service-bus/#i1)

### Ervaren problemen
[Geef een korte beschrijving van de problemen waar je tegenaan bent gelopen met je gevonden oplossing.]

### Resultaat
#### Active Directory

Azure Active Directory (Azure AD) is a cloud-based service for identity and access management.
Azure AD allows you to create role-assignable groups and assign Azure AD roles to these groups. This feature simplifies role management, ensures consistent access, and makes auditing permissions more straightforward.

Services Azure AD provides:
- Authentication (MFA)
- Single sign-on (SSO) - Use a single sign-in to access all resources that a user has permission to access.
- Application management - Manage cloud and on-premises apps
- Device management - Allows for device-based Conditional Access policies to restrict access attempts. 
Microsoft Intune provides cloud-based mobile device management.
- Conditional Access - Decide who gets access to what resources, based on things like who the user is, where they are, and what device they're using.
Some examples of conditions:

    |Conditions|Controls|
    |---|---|
    |When any user is outside the company network|They're required to sign in with multifactor authentication|
    |When users in the 'Managers' group sign-in|They are required be on an Intune compliant or domain-joined device|

The cloudbased Azure AD can be connected to on-premise Active Directory using Azure AD Connect to create a hybrid environment.

![Image](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/AZ-W6_screen02.png)

---
#### Azure Monitor
Azure Monitor is a comprehensive service provided by Microsoft Azure for collecting, analyzing, and acting on telemetry from cloud and on-premises environments. It is used by IT Operations, DevOps, and developer teams to maximize the availability and performance of applications and services.
Azure Monitor is enabled by default. As soon as you create an Azure subscription and start adding resources such as web apps, Azure Monitor starts collecting data.
- Metrics are stored 93 days by default.

![Image](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/AZ-W6_screen03.png)

Key aspects of Azure Monitor:

- The collected data is stored in one of two data stores: Azure Monitor Metrics for numerical time-series values and Azure Monitor Logs for storing log data.
- Azure Monitor metrics are automatically collected and stored for Azure resources, but user configuration is required to send and store resource logs in Azure Monitor Logs.
- You can use Azure Monitor to visualize data with workbooks and dashboards, as well as analyze data with custom charts and analytics. Azure Monitor lets you receive notifications and take automated actions based on performance and availability criteria.
- Includes Insights, each Insight is tailored to a specific service. They provide detailed, service-specific views that can help you understand the operation of that service in depth.
Here are some examples of Insights in Azure Monitor:
    - Application Insights - This is designed for application developers. helps you understand how your app is performing and how it's being used.
    - VM Insights - Provides an in-depth view of your virtual machines' performance
    - Container Insights - This monitors the performance of container workloads deployed to managed Kubernetes clusters hosted on Azure Kubernetes Service (AKS).
    - Network Insights - provides a comprehensive view of your network performance.
    - Storage Insights - Provides detailed metrics and logs for your Azure Storage accounts

Azure Dashboards helps you visualize and combining different kinds of data in 1 single pane.

Workbooks provide a flexible canvas for data analysis and creating rich visual reports in the Azure portal

**Azure Monitor Metrics**
Each set of recorded values contains the following set of properties:
- A time stamp from when the value was collected
- The associated resource for the value
- A namespace, which acts as a category for the metric
- A metric name
- The actual value that was recorded
- Multi-dimensional metrics for supported recorded values

With the Azure Monitor agent installed on your virtual machines, you can collect data from the guest operating system and any applications running on it. Data is presented in a chart or graph format.

**Metrics & Logs**
With **Metrics explorer** you can focus on analyzing metrics of a specific resource.

By setting up a **Log Analytics workspace** You can analyze log data  with queries to quickly retrieve, consolidate, and analyze collected data.

---
#### CosmosDB
I installed Azure CosmosDB Emulator on my local pc. Imported this sample [database](https://github.com/Azure-Samples/azure-cosmos-db-sample-data/blob/main/SampleData/VolcanoData.json) with data about volcano's worldwide. Then I ran some queries and played with the data a little bit.

![Image](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/AZ-W6_screen04.png)

**Azure Cosmos DB**
Azure Cosmos DB is a globally distributed, multi-model database service designed for scalable and high performance modern applications. It's delivered as a fully managed service within Microsoft Azure (PaaS).


Azure Cosmos DB is a non-relational or NoSQL database. This means it doesn't use the traditional table-based relational database structure. Its a great way to store and query unstructured data.

**Global Distribution**: Cosmos DB is designed for global distribution. It allows you to scale and replicate your data across multiple regions. This means your data is close to your users, providing them with low latency access. 

**Multi-Model Support**: Cosmos DB supports multiple data models including key-value, document, wide column, and graph. It also provides multiple APIs for accessing data including SQL, MongoDB, Cassandra, Tables, and Gremlin.

**Elastic Scalability**: Cosmos DB allows you to scale throughput and storage elastically across the globe.\

**High Availability** and Real-Time Analytics with **Azure Synapse Link**.


##### Cost
Cosmos DB can be expensive, especially if not used correctly. You pay for the throughput you provision measured in Request Units (RU). Every operation in Cosmos DB, such as read, write, or query, costs a certain number of RUs.

In terms of integration, Azure Cosmos DB can work with a variety of Azure resources. For instance, it can be used with Azure Functions for serverless computing, Azure Synapse Analytics for big data analytics, and Azure Logic Apps for building automated workflows.

Compared to other databases in Azure, Cosmos DB stands out for its global distribution, multi-model support, and elastic scalability. However, for applications that don't require these features, other databases like Azure SQL Database or Azure Database for PostgreSQL might be more cost-effective.

---
### Azure Functions
Azure Functions lets you develop serverless applications on Microsoft Azure. You can write just the code "functions" you need for the problem at hand, without worrying about a whole application or the infrastructure to run it.
Functions can be triggered by a variety of events.

Examples of things you can do with it:
- Schedule Task - Send daily report at the end of each day.
- Processing Data - a function that is triggered whenever a new image is uploaded to Blob Storage. Then resize or convert it.
- Processing Datastreams = a function that is triggered when there an incoming datastream of data from a device and analyze it.
- Microservices - Performs a specific function as part of a larger system. An API that accepts a product ID and return the stock level.


Extension of Azure App Services.

Supports Multiple languages:
C# (.NET, .NET Core), Java, JavaScript (NodeJS), Python, F#.

Azure Functions uses a pay-as-you-go model, where you are billed based on your actual usage of the service. There are two main components to the billing:
- Consumption Plan: includes a monthly free grant of 1 million requests and 400,000 GB-s of resource consumption per month (execution time + total executions)
- Premium Plan: Same features as the Consumption Plan with no cold start, enhanced performance and VNET access. Billing for the Premium plan is based on the number of core seconds and memory allocated across instances. There is no execution charge. (CPU time + Memory time)

**Pricing Tier Timeout Differences**
There is a limitation of Azure Functions in the duration of how long a Function of code can run:
|Pricing Tier|Default Timeout|Minimum|Maximum|
|---|---|---|---|
|Consumption Plan|5 min|1 min|10 min|
|Premium Plan|30 min|1 sec|60 min|
|App Service Plan|30 min||No limit (set using `-1` value)|

---

### Event Grid, Queue Storage, Service Bus
---

###Event Grid
Azure Event Grid is a fully managed event routing service provided by Microsoft Azure. It enables applications to react to events happening within other Azure services or on-premises servers. Event Grid simplifies the development of event-based applications and serverless workflows by managing the routing of events from any source, to any destination, at massive scale. It's designed to be highly available and to dynamically scale based on your traffic.
![Image](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/AZ-W6_screen05.png)

Key Concepts:
- **Publisher** - Publishers are users or a third party that chooses to send events to Azure Event Grid.
- **Event sources** - the origin for an event to take place and it is responsible for transmitting events to Azure Event Grid.
- **Event Grid Topics** - Event topics classify events into groups and provide an endpoint where the sources transmit events.
    - When an event happens in a service, that service sends the event data to a specific Event Grid Topic. Other services, known as subscribers, can then receive these events from the topic and take action based on the event data.
- **System Topic** in Azure Event Grid is a built-in topic provided by Azure services. It's like a pre-made channel that certain Azure services use to send out events.
Unlike custom topics that you create yourself, system topics are owned and managed by the Azure service that publishes the events. This means they're not visible in your Azure subscription, but you can still subscribe to them to receive events.

**Azure Event Grid subscriptions**
Event subscriptions in Azure Event Grid are like signing up for updates or notifications about specific events. They define which events under a topic an event handler wants to receive.
Event subscriptions can be set up to filter events based on their type or subject. This is like choosing to only receive emails about specific subtopics.
Some destination endpoints (Event Handlers) those can be configured with the Event Subscriptions are:
- [x] Azure Automation
- [x] Azure Functions
- [x] Event Hubs
- [x] Queue Storage
- [x] Service Bus

**Event Handlers**
An event handler is an application or resource that receives events from Azure Event Grid, in simple words, it is the place where an event is sent. The handler proceeds with certain actions to process the event.

**Security**
Security is one of the important parameters in any resource. Azure Event Grid provides security for subscribing to topics, and publishing topics. When subscribing, you must have adequate permissions on the resource or event grid topic. When publishing, you must have a SAS token or key authentication for the topic.

---
### Azure Queue Storage

![Image](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/AZ-W6_screen06.png)

Azure Queue Storage is a sub-service of Azure Storage Account.
Azure Queue storage is a service used for storing the various large number of messages which need to be accessed from any region in the world. As it uses Azure data centers worldwide, these calls should come via authenticated calls using HTTP or HTTPS.

These queues enables communication between components of a distributed application. Each queue maintains a list of messages that can be added by a sender component and processed by a receiver component. With a queue, your application can scale immediately to meet demand. 

Azure Queue Storage can also be used to create a backlog of work to process asynchronously. Azure Queue storage can store millions of incoming messages up to the total capacity of the storage account, and each message size can be up to 64 KB. It is also cost-effective storage which queues up all the incoming calls and messages them between different applications.

#### Messages
**Message Content**: The content of a message can be any text string, up to 64 KB in size. This often includes XML, JSON, or other types of structured data that can be used to communicate information between different parts of a distributed system.

**Message Lifecycle**: When a message is added to a queue, it becomes invisible to other components for a specified period of time. This is to allow the component that retrieved the message to process it and delete it from the queue. If the message is not deleted within the invisibility period, it becomes visible again and can be retrieved by another component. 

**Message ID**: Each message has a unique ID that can be used to identify the message. This ID is assigned by Azure Queue Storage when the message is added to the queue.

Dequeue Count: Each message in a queue has a dequeue count, which is incremented each time the message is retrieved from the queue. This can be used to detect messages that cannot be processed for some reason. 

**Pop Receipt**: When a message is retrieved from the queue, Azure Queue Storage also returns a pop receipt. This is a token that must be provided when deleting the message or changing its visibility timeout.

Azure Queue Storage is often used for building loosely coupled systems, where different components communicate by exchanging messages through a queue. This can help to build systems that are scalable, reliable, and flexible.

---
### Azure Service Bus

![Image](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/AZ-W6_screen06.png)

Azure Service Bus is a Cloud-based Messaging as a Service (MaaS) Platform. It is a high-performance, real-time, and fault-tolerant service that transfers messages between your applications and databases securely. 

Azure Service Bus can connect to any application, service, or a device running in the cloud and can establish communication with other applications, services, or receivers seamlessly.

Storage queues and Service Bus queues have slightly different feature sets. You can choose either one or both, depending on the needs of your particular solution. Azure Storage Queues are simpler to use but are less sophisticated and flexible than Service Bus queues.


- Maximum Message Size: 256KB (standard tier), 100 MB (premium tier).
- Maximum Queue Size: 1GB - 80 GB
- Advanced Messaging Patterns - Service Bus supports more complex messaging patterns, including topics and subscriptions, which allow for publish-subscribe scenarios, and sessions, which allow for message ordering and grouping.
- Integration: Service Bus has built-in integration with many Azure services and supports AMQP 1.0 protocol
- Duplicate Detection: Service Bus can automatically detect and remove duplicate messages.
- Service Bus supports Dead-Letter Queues, which are used to store messages that can't be processed for some reason.
- Transactions support.

