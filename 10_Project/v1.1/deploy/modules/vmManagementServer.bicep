// Parameters
param location string
param envType string
param availabilityZone string = '1'
param vmNamePrefix string = 'management'
param vnet1Subnet1Id string
param OSVersion string = '2022-datacenter-azure-edition'
param diskEncryptionSetID string
param staticIP string = '10.10.10.10'

var vmName = '${vmNamePrefix}-Vm-${envType}'

@secure()
param secretAdminUserName string
@secure()
param secretAdminPassword string

//-------------------------------------------
// Create a public ip for managementserver vm
//-------------------------------------------
resource publicIP 'Microsoft.Network/publicIPAddresses@2023-04-01' = {
  name: '${vmName}PublicIP'
  location: location
  zones: [
    '1'
  ]
  properties: {
    publicIPAllocationMethod: 'Static'
  }
  sku: {
    name: 'Standard'
  }
}

//-------------------------------------
// Create a nic for managementserver vm
// attach subnet and public ip to nic
//-------------------------------------
resource vmNic 'Microsoft.Network/networkInterfaces@2023-04-01' = {
  name: '${vmName}Nic'
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig'
        properties: {
          privateIPAllocationMethod:'Static'
          privateIPAddress: staticIP //assigned a static ip
          publicIPAddress: {
            id: publicIP.id
          }
          subnet: {
            id: vnet1Subnet1Id
          }
        }
      }
    ]
  }
}

//----------------------------------------------------------------
// Create a vm to use as a managmentserver
// attach nic to vm
// attach os-disk to disk encryption set + encryption-at-host enabled
//----------------------------------------------------------------
resource ManagementServer 'Microsoft.Compute/virtualMachines@2023-03-01' = {
  name: vmName
  location: location
  zones: [
    availabilityZone
  ]
  properties: {
    hardwareProfile: {
      vmSize:'Standard_B1ms' //Standard_B2s,
    }
    osProfile: {
      computerName: 'ManagementSrv' 
      adminUsername: secretAdminUserName
      adminPassword: secretAdminPassword
    }
    storageProfile: {
      imageReference: {
        publisher: 'MicrosoftWindowsServer'
        offer: 'WindowsServer'
        sku: OSVersion
        version: 'latest'
      }
      osDisk: {
        name: '${vmName}_osdisk'
        createOption: 'FromImage'
        managedDisk: {
          storageAccountType:'Standard_LRS' //Standard_LRS
          diskEncryptionSet: {
            id: diskEncryptionSetID
          }
        }        
      }
    }
    securityProfile: {
      encryptionAtHost: true
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: vmNic.id
        }
      ]
    }
  }
}

output managementServerIP string = vmNic.properties.ipConfigurations[0].properties.privateIPAddress //internal ip
output managementServerPublicIP string = publicIP.id
output managementServerId string = ManagementServer.id
