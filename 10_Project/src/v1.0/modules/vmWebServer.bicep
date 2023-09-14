// Parameters
param location string
//param availabilityZone string = [1]
param vmName string = 'vmWebServer'
param subnetId string
param diskEncryptionSetID string


@secure()
param secretAdminLogin string
@secure()
param secretAdminPassword string


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

resource vmNic 'Microsoft.Network/networkInterfaces@2023-04-01' = {
  name: '${vmName}NIC'
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig'
        properties: {
          privateIPAllocationMethod: 'Static'
          privateIPAddress: '10.20.20.20' //assign static ip
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

resource vmWebServer 'Microsoft.Compute/virtualMachines@2023-03-01' = {
  name: vmName
  location: location
  zones: [
    '1'
  ]
  properties: {
    hardwareProfile: {
      vmSize:'Standard_B1s'
    }
    osProfile: {
      computerName: 'Ubuntu-WebSrv'
      adminUsername: secretAdminLogin
      adminPassword: secretAdminPassword
      customData: loadFileAsBase64('init_webserver.sh')
    }
    storageProfile: {
      imageReference: {
        publisher: 'canonical'
        offer: '0001-com-ubuntu-server-jammy'
        sku: '22_04-lts-gen2'
        version: 'latest'
      }
      osDisk: {
        name: '${vmName}_osdisk'
        createOption: 'FromImage'
        managedDisk: {
          storageAccountType: 'Standard_LRS'
          diskEncryptionSet: {
            id: diskEncryptionSetID
          }
        }
      }
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

output vmWebServerId string = vmWebServer.id
output vmWebServerName string = vmWebServer.name
