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

Origin Servers: These are the original or primary servers where your content is hosted. This could be an Azure web app, Azure Cloud Service, Azure Storage account, Azure IaaS virtual machine, or any publicly accessible web server. When a user requests content that isn't in the CDN's cache, the CDN retrieves the content from the origin server.

Edge Servers: These are the servers in the CDN that are closest to the users. They store cached content from the origin server and deliver it to users. This reduces latency because the content doesn't have to be retrieved from the origin server every time a user requests it.

Point of Presence (POP)
A POP is a site that houses edge servers. POPs are located in various geographical locations around the world to ensure that content can be delivered to users quickly, regardless of their location.

Azure CDN Cache Behavior:
When a file is requested, Azure CDN checks if it's in the cache. If it's not, the CDN retrieves it from the origin server, caches it, and delivers it to the user. The file remains in the cache until its time-to-live (TTL) expires. If the origin server didn't specify a TTL, the default TTL is seven days.

- Generalized web delivery optimizations: seven days
- Large file optimizations: one day
- Media streaming optimizations: one year

Default caching rules of Azure CDN standard tier:

- Ignore query strings: This option is the default mode. A CDN POP simply passes the request and any query strings directly to the origin server on the first request and caches the asset. New requests for the same asset will ignore any query strings until the TTL expires.
- Bypass caching for query strings: Each query request from the client is passed directly to the origin server with no caching.
- Cache every unique URL: Every time a requesting client generates a unique URL, that URL is passed back to the origin server and the response cached with its own TTL. This final method is inefficient where each request is a unique URL, as the cache-hit ratio becomes low.

Azure CDN is particularly useful for technologies that employ many large static files, like photographic images or videos. It is most useful where you need the ability to serve files to a large number of simultaneous users worldwide. If the content was more dynamic Azure CDN wouldn't offer significant advantages.

Azure CDN can also enhances performance by compressing files before delivery, reducing data transfer, and decompressing them at the user's end. Additionally, it offers geo-filtering, enabling content access rules based on user location, thus allowing or blocking content in specific regions.

**Azure DNS**

Azure DNS is a cloud service that allows you to host and manage domain name system (DNS) domains, also known as DNS zones. A DNS zone is a collection of DNS records. DNS records can relate a Fully Qualified Domain Name (FQDN) associated with the zone to an IP address or another DNS record.

Azure DNS can replace traditional DNS servers that you might run on-premises. Instead of managing a DNS server yourself or through a third-party DNS provider. Azure DNS is more resilient to network failures than DNS services hosted on individual servers.

Azure DNS can be fully integrated with other Azure resources. It allows you to automatically update records based on when you deploy or modify resources in Azure. This makes it easier to manage and update your DNS records.

Azure DNS Public Zones: These are used to host domain name zone data for records that you intend to be resolved by any host on the internet. They support all common DNS record types including A, AAAA, CNAME, MX, PTR, SOA, SRV, and TXT records.

Azure DNS Private Zones: These are used to host DNS zones for your private network in Azure. They allow you to use your own custom domain names rather than the Azure-provided names. Private zones can be used to resolve domain names in a virtual network and between virtual networks. This is useful for internal communications within an Azure virtual network. They also support all common DNS record types.

Aliases: In Azure DNS, you can use an alias record set to refer to an Azure resource, such as an Azure public IP address, an Azure Traffic Manager profile, or an Azure Content Delivery Network (CDN) endpoint. If the IP address of the underlying resource changes, the alias record set seamlessly updates itself during DNS resolution. This means you don't have to manually update the record if the IP address changes.


## Opdracht
### Gebruikte bronnen
- https://www.pragimtech.com/blog/azure/what-is-azure-app-service/
- https://learn.microsoft.com/en-us/azure/app-service/overview
- https://learn.microsoft.com/en-us/training/modules/introduction-to-azure-files/
- [fileREST API](https://learn.microsoft.com/en-us/rest/api/storageservices/file-service-rest-api)
- https://learn.microsoft.com/en-us/training/modules/intro-to-azure-content-delivery-network/
- https://learn.microsoft.com/en-us/training/modules/azure-database-fundamentals/
- https://azure.microsoft.com/en-us/products/category/databases
- ChatGPT
- [Create sample databse](https://learn.microsoft.com/en-us/azure/azure-sql/database/single-database-create-quickstart?view=azuresql-db&tabs=azure-portal)



### Ervaren problemen
[Geef een korte beschrijving van de problemen waar je tegenaan bent gelopen met je gevonden oplossing.]

### Resultaat
#### Azure Files
Azure Files is a subservice of Azure Storage Account that offers fully managed file shares in the cloud. These file shares are network storage locations that can be used as local storage on your operating system. Here are some key points about Azure Files:

Protocols: Azure Files supports two industry-standard file sharing protocols: Server Message Block (SMB) and Network File System (NFS). SMB can be used with Windows, Linux, and macOS clients. NFS can be used with Linux and macOS clients. Azure Files also has a REST API.

Mounting: Azure file shares can be mounted concurrently by cloud or on-premises deployments. SMB Azure file shares can also be cached on Windows servers with Azure File Sync for faster access near where the data is being used.

Lift and Shift:  Moving a copy of an existing application and data to cloud infrastructure with minimal or no redesigning or modification. Azure Files makes it easy to "lift and shift" applications to the cloud that expect a file share to store file application or user data. 


Tiers: Azure Files offers multiple tiers that you can select based on your budget and performance needs.
    - Premium (SSD), [SMB, REST, NFS], [LRS,ZRS], only provisioned billing model
    - Standard (HDD), [SMB, REST], pay as you go, provisioned billing model.
    - Hot/Cool file shares

Persistent Volumes for Containers: Azure file shares can be used as persistent volumes for stateful containers. This allows containers to access the file system no matter which instance they run on.

Access control in Azure Files is about managing who can access your file shares and what they can do with the data. There are several ways to authenticate users and provide access to Azure file shares:
- Identity-based authentication is supported by SMB, using on-premises AD DS, Azure AD DS, Azure AD.
- Storage account key: A user with the storage account key can access Azure file shares with superuser permissions over SMB and REST
- Shared access signature (SAS) - Customers accessing over REST can use a SAS to authenticate with Azure Files. A SAS is a URI that grants restricted access rights to Azure Storage resources.

Created an file share in Storage Account and succesfully mounted it in windows.
![Image](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/AZ-13_screen01.png)
![Image](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/AZ-13_screen02.png)


#### Azure Database
Azure SQL Managed Instance is a cloud-based, fully managed version of the SQL Server database engine provided by Microsoft Azure, which automates most of the database management functions, allowing users to focus more on their data and less on database maintenance.
Azure offers a choice of relational and non-relational databases:

**Relational Databases**
- Azure SQL Database: It is a fully managed relational cloud database service that provides the broadest SQL Server engine compatibility. Best for:
    - High-performance transactional applications
    - Finance, sales order management, systems of record

- Azure Database for PostgreSQL: It is a fully-managed database service for app developers using community PostgreSQL (Open-source). Best for:
    - Secure and scalable e-commerce solutions
    - Finance management apps
    - Scalable web and mobile apps

- Azure Database for MySQL: It is a fully-managed database service for app developers using the MySQL community edition (Open-source).
    - Scalable web and mobile apps
    - High-performance and secure finance management apps
    - Low-latency gaming experiences

- Azure Database for MariaDB (Open-source): It is a fully managed, enterprise-ready community MariaDB database as a service.


**Non-relational Databases**
- Azure Cosmos DB - A globally distributed, multi-model database service
- Azure Cache for Redis: It improves the performance of your applications by providing a high-speed, distributed cache that reduces latency for data access.
- Azure Database for MongoDB: A fully managed service that is compatible with the MongoDB community edition.
- Azure Table Storage: A service that stores structured NoSQL data in the cloud, providing a key/attribute store with a schema-less design.



**Relational Database** - Relational databases, often referred to as SQL databases, use Structured Query Language (SQL) for defining and manipulating the data. They are characterized by a set of tables where data gets fit into predefined categories. Each table has one or more data categories in columns, and each row has a specific data instance for the categories defined by the columns.

**Azure Non-relational Databases**
Non-relational databases, often referred to as NoSQL databases, store data in a non-tabular form, and the schema can be implicit and not as strictly enforced as in relational databases. These are often used for large sets of distributed data.


**Relationship** Connection or interaction between two or more data tables, which helps in organizing and structuring the data
**Primary Key:** A unique identifier for each record in a table.
**Foreign Key:** A field (or collection of fields) in one table that refers to the PRIMARY KEY in another table.


**SQL**
SQL (Structured Query Language) is a standard language for managing and manipulating relational databases.
Keywords used in SQL:

- SELECT: Used to select data from a database and retrieve just the information you want.
- FROM: Specifies the table from which to retrieve the data.
- WHERE: Used to filter records based on specific conditions.
- INSERT INTO: Used to insert new data into a table.
- UPDATE: Used to modify the existing records in a table.
- DELETE: Used to remove existing records from a table.
- CREATE DATABASE: Used to create a new database.
- ALTER DATABASE: Used to modify a database.
- CREATE TABLE: Used to create a new table.
- ALTER TABLE: Used to modify a table.
- DROP TABLE: Used to delete a table.
- JOIN: Used to combine rows from two or more tables, based on a related column.
- UNION: Used to combine the result-set of two or more SELECT statements.
- GROUP BY: Used to group rows that have the same values in specified columns into aggregated data.
- HAVING: Like a WHERE clause, but for use with GROUP BY.
- ORDER BY: Used to sort the result-set in ascending or descending order.
- INDEX: Used to create and retrieve data from the database very quickly.
