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
Advisor is a personalized cloud consultant that helps you follow best practices (CROPS) to optimize your Azure deployments. It analyzes your resource configuration and usage telemetry and then recommends solutions that can help you improve the cost effectiveness, performance, high availability, and security of your Azure resources .


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


### Ervaren problemen
[Geef een korte beschrijving van de problemen waar je tegenaan bent gelopen met je gevonden oplossing.]

### Resultaat
[Omschrijf hoe je weet dat je opdracht gelukt is (gebruik screenshots waar nodig).]
