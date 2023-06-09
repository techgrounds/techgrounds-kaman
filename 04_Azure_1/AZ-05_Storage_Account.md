# Azure Storage Account
An Azure storage account contains all of your Azure Storage data objects: blobs, files, queues, and tables. The storage account provides a unique namespace for your Azure Storage data that's accessible from anywhere in the world over HTTP or HTTPS. Data in your storage account is durable and highly available, secure, and massively scalable.

## Key-terms
- Azure Resource Manager
- Blob - Binary Large Object
- Blob Storage
- Containers
- 3 Tiers: Hot, Cool, Archive
- Azure Storage account is a collection of
    - blob storage
    - queue storage
    - table storage
    - file storage

Azure Storage supports three types of blobs:
- Block blobs store text and binary data. Block blobs are made up of blocks of data that can be managed individually. Block blobs can store up to about 190.7 TiB.
- Append blobs are made up of blocks like block blobs, but are optimized for append operations. Append blobs are ideal for scenarios such as logging data from virtual machines.
- Page blobs store random access files up to 8 TiB in size. Page blobs store virtual hard drive (VHD) files and serve as disks for Azure virtual machines. For more information about page blobs, see

## Opdracht
### Gebruikte bronnen
- https://learn.microsoft.com/en-us/azure/storage/common/storage-account-overview
- https://learn.microsoft.com/en-us/azure/storage/blobs/storage-blob-static-website-host
- https://www.youtube.com/watch?v=_Qlkvd4ZQuo

### Ervaren problemen
Geen echte problemen ervaren. Moest in het begin uitzoeken waar alle instellingen staan en wat ze doen. 

### Resultaat

Storage account aangemaakt. (Blob public access Disabled)
Created a container and uploaded an image to the it.

![Image](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/AZ-05_screen010.png)

Enabled static website and uploaded the website to the new container ($web).
![Image](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/AZ-05_screen020.png)