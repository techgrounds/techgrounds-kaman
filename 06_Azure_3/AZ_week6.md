# [Onderwerp]
[Geef een korte beschrijving van het onderwerp]

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

