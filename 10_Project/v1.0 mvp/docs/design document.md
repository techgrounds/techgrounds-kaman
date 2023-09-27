# Design documentation for v1.0

## Introduction
For this project, all resources and configuration will be implemented using Bicep scripts. The scripts will be designed to meet all project requirements.

## Selected Resources
### Network
Requirement:
```
- The following IP ranges are used: 10.10.10.0/24 & 10.20.20.0/24
```
Two virtual networks (Vnets) will be created. Vnet1 will have the IP range 10.10.10.0/24 and Vnet2 will have the IP range 10.20.20.0/24. The two Vnets will be connected using peering. A subnet will be created in each Vnet. The subnet in Vnet1 will have the IP range 10.10.10.0/24 and the subnet in Vnet2 will have the IP range 10.20.20.0/24.


### Network security
Requirement:
```
- All subnets must be protected by a subnet-level firewall.
- The admin/management server must only be accessible from trusted locations (office/admin’s home)
- SSH or RDP connections to the web server must only be made from the admin server.
```

To ensure that all subnets are protected by a subnet-level firewall, the following steps will be taken:

- Two network security groups (NSGs) will be created.
- The NSG for the web server subnet will be configured to allow the following traffic:
    - Only allow SSH connections from the management server.
    - Web traffic.
- The NSG for the management server subnet will be configured to allow the following traffic: 
    - SSH connections from a specified IP address. 
    - RDP connections from a specified IP address (if needed).
- These settings will ensure that the web server and management server are only accessible from trusted locations and that SSH and RDP connections can only be made from authorized users.


### Webserver
Requirement:
`The web server must be installed in an automated way.`

A virtual machine running Ubuntu Server will be created to function as a web server. Apache web server will be automatically installed using a cloud init script. The virtual machine will be placed in Vnet2 and assigned a public IP address. To ensure that the web server is only accessible from the management server, an NSG rule will be created that allows traffic from the management server to the web server. This will prevent unauthorized access to the web server.

### Managementserver
Requirement:
`The admin/management server must be accessible with a public IP.`
`The admin/management server should only be accessible from trusted locations `

To ensure that the management server is accessible from trusted locations, while still allowing it to be accessible with a public IP, the following steps will be taken:

- A virtual machine running Windows Server will be created to function as the management server.
- The management server will be placed in a virtual network called Vnet1. This virtual network will be used to isolate the management server from other resources in Azure.
- A public IP address will be attached to the management server VM.
- An IP address from a trusted source, such as the office network, can be configured to restrict access to the management server to only that IP address. This can be done using a security rule inside the network security group.


### Storage
Requirement:
`A location must be available where bootstrap scripts can be made available. These scripts must not be publicly accessible.`

To ensure that the bootstrap scripts are not publicly accessible, a storage account will be created and configured as private. A blob container will be created in the storage account to store the bootstrap scripts. The storage account will be encrypted using a customer managed key. A user assigned managed identity will be used to retrieve the encryption key from the key vault to encrypt the storage account. 

### Encryption
Requirement:
`All VM disks must be encrypted.`

For the security of our project, all the disks of the Virtual Machines will be encrypted. To do this, we use a Key Vault to store the encryptions key that is used to encrypt the disks and passwords for the VM's.
Next we use a Disk Encryption Set to encrypt all the VM-disks using a Customer Managed Key.
Data in the storage account will also be encrypted with a Customer Managed Key.
This approach makes sure that all sensitive data in our project remains secure and well-protected at all times.

### Backup
Requirement:
```The web server must be backed up daily. The backups must be retained for 7 days.```

To secure the web server's data a Recovery Service Vault will be created. A backup of the webserver will be created daily and stored inside the Recovery Service Vault. These backups will be kept for a duration of 7 days, forming a rotating collection of data from last week. This practice ensures that, in the event of any technical disruptions or data loss, we can restore the system to a very recent state and minimizing data loss.


### Costs



## List of Resources

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