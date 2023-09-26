# Design documentation for v1.1

## Introduction
For this project, all resources and configuration will be implemented using Bicep scripts. The scripts will be designed to meet all project requirements.


### Architecture
![Image](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/Project_screen01.png)

----
## Selected Resources
### Network
Requirement:
- [x] The following IP ranges are used: 10.10.10.0/24 & 10.20.20.0/24

Two virtual networks (Vnets) will be created. 
- Vnet1 will have the IP range 10.10.10.0/24 
- Vnet2 will have the IP range 10.20.20.0/24.

The two Vnets will be connected using peering. One Vnet will have one subnet where the management server VM will be placed. The other Vnet will have two subnets:

- 1 subnet for the Application Gateway.
- 1 subnet for a VM Scale Set


### Network security
Requirement:

- [x] All subnets must be protected by a subnet-level firewall.
- [x] The admin/management server must only be accessible from trusted locations (office/admin’s home)
- [x] SSH or RDP connections to the web server must only be made from the admin server.


To ensure that all subnets are protected by a subnet-level firewall, the following steps will be taken:
A network security groups (NSGs) will be created for each subnet:

- The NSG for the web server subnet will be configured to allow the following traffic:
    - Only allow SSH connections from the management server.
- The NSG for the management server subnet will be configured to allow the following traffic: 
    - RDP connections from a specified IP address (trusted location).
- The NSG for the subnet where the Application Gateway is located will allow the following traffic:
    - Allow HTTP 
    - Allow HTTPS

These settings will ensure that the web server and management server are only accessible from trusted locations and that SSH and RDP connections can only be made from authorized users.

### Managementserver
Requirement:
- [x] The admin/management server must be accessible with a public IP.
- [x] The admin/management server should only be accessible from trusted locations.

To ensure that the management server is accessible from trusted locations, while still allowing it to be accessible with a public IP, the following steps will be taken:

- A virtual machine running Windows Server will be created to function as the management server.
- The management server will be placed in a virtual network called Vnet1. This virtual network will be used to isolate the management server from other resources in Azure.
- A public IP address will be attached to the management server VM.
- An IP address from a trusted source, such as the office network, can be configured to restrict access to the management server to only that IP address. This can be done using a security rule inside the network security group.

### VM Scale Set (web pool)
Requirement:
- [x] The web server must be installed in an automated way.
- [x] If the web server fails this health check, the server should be automatically restored.
- [x] If the web server comes under sustained load, a temporary additional server should be started. The client thinks that no more than 3 servers in total are needed given the user numbers in the past.

To ensure high availability under load, a VM Scale Set is used to scale up when the cpu load exceeds a certain threshold. It will scale up to a maximum of 3 instances. The VMs running in the scale set will run on Ubuntu Server and function as web servers. Apache web server will be automatically installed using a cloud-init script.

By using automatic repair and a health extension, the health status of the VMs will be constantly checked. If a VM is unhealthy, it will be deleted and a new one will be spawned. This ensures that there is always at least one healthy VM running in the scale set, and that the web application is always available to users.

### Application Gateway
Requirement:
- [x] The web server should no longer be accessible "naked" on the internet. The client would prefer a proxy in between. the server should no longer have a public IP address.
- [x] If a user connects to the load balancer via HTTP, this connection should automatically be upgraded to HTTPS.
- [x] The connection must be secured with at least TLS 1.2 or higher.

The Application Gateway has a public IP address attached and handles all traffic from the internet. It also establishes a secure HTTPS connection (TLS 1.3) between the user and the application gateway using a self-signed certificate. All HTTP traffic is redirected to HTTPS. The application gateway then forwards traffic to the backend pool, which is set to be the VM scale set. This ensures that all traffic between the user and the application gateway is encrypted and protected.


### Encryption
Requirement:
- [x] All VM disks must be encrypted.

For the security of our project, all the disks of the Virtual Machines will be encrypted. To do this, we use a Key Vault to store the encryptions key that is used to encrypt the disks and passwords for the VM's.
Next we use a Disk Encryption Set to encrypt all the VM-disks using a Customer Managed Key.
Data in the storage account will also be encrypted with a Customer Managed Key.
This approach makes sure that all sensitive data in our project remains secure and well-protected at all times.

### Storage
Requirement:
- [x] A location must be available where bootstrap scripts can be made available. These scripts must not be publicly accessible.

To ensure that the bootstrap scripts are not publicly accessible, a storage account will be created and configured as private. A blob container will be created in the storage account to store the bootstrap scripts. The storage account will be encrypted using a customer managed key. A user assigned managed identity will be used to retrieve the encryption key from the key vault to encrypt the storage account. 

----

## List of Resources

V1.0
- 2 Virtual Networks
    - 2 Subnets
    - 2 Network Security Groups
    - Virtual Network Peering
- 1 Storage account voor opslag van bootstrap scripts
    - Blob storage met private toegang
- 2 Virtual Machines
    - 2 Public IP addresses
    - 2 VM NIC's
- 1 Keyvault
    - 1 Managed Identity
    - 1 User generated Key
- Disk encryption set
- Recovery Service Vault


v1.1
- 1 additional subnet
- 1 additional NSG
- Application Gateway
    - public ip
- VM Scale set
    - Health extension
    - Autoscale settings


## VS Code Visualizer
![Image](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/visualiser_v11.png)