// Parameters
param location string
//param availabilityZone string = [1]
param vmName string = 'vmManagementSrv'
param subnetId string
param OSVersion string = '2022-datacenter-azure-edition'
param diskEncryptionSetID string

@secure()
param secretAdminLogin string
@secure()
param secretAdminPassword string

resource publicIP 'Microsoft.Network/publicIPAddresses@2023-04-01' = {
  name: '${vmName}PublicIP'
  location: location
  zones: [
    '2'
  ]
  properties: {
    publicIPAllocationMethod: 'Static'
  }
  sku: {
    name: 'Standard'
  }
}

resource vmNic 'Microsoft.Network/networkInterfaces@2023-04-01' = {
  name: '${vmName}NIC'
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig'
        properties: {
          privateIPAllocationMethod:'Static'
          privateIPAddress: '10.10.10.10' //assigned a static ip
          publicIPAddress: {
            id: publicIP.id
          }
          subnet: {
            id: subnetId
          }
        }
      }
    ]
  }
}

resource vmManagementSrv 'Microsoft.Compute/virtualMachines@2023-03-01' = {
  name: vmName
  location: location
  properties: {
    hardwareProfile: {
      vmSize:'Standard_B1ms' //Standard_B2s
    }
    osProfile: {
      computerName: 'ManagementSrv' 
      adminUsername: secretAdminLogin
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

output managementSrvIP string = vmNic.properties.ipConfigurations[0].properties.privateIPAddress
