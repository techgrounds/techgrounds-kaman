@description('The environment type of this deployment')
@allowed([
  'dev'
  'prod'
])
param envType string = 'dev'
//param managementSvrIP string
param location string = resourceGroup().location
param deploymentName string = deployment().name //for randomizing name of resources

@secure()
param secretAdminLogin string
@secure()
param secretAdminPassword string


//modules
module virtualnetworks 'modules/network.bicep' = {
  name: 'virtualnetworks'
  params: {
    location: location
  }
}

module storageAccount 'modules/storageAccount.bicep' = {
  name: 'storageAccount'
  params: {
    location: location
    envType: envType
    managedId: encryption.outputs.managedId
    keyVaultUri: encryption.outputs.keyVaultUri
    diskEncryptionKeyName: encryption.outputs.diskEncryptionKeyName
  }
}

module webServer 'modules/vmWebServer.bicep' = {
  name: 'webServer'
  params: {
    location: location
    subnetId: virtualnetworks.outputs.subnet2Id
    secretAdminLogin: secretAdminLogin
    secretAdminPassword: secretAdminPassword
    diskEncryptionSetID: encryption.outputs.diskEncryptionSetID

    //envType: envType
   }
}

module managementServer 'modules/vmManagementServer.bicep' = {
  name: 'managementServer'
  params: {
    location: location
    subnetId: virtualnetworks.outputs.subnet1Id
    secretAdminLogin: secretAdminLogin
    secretAdminPassword: secretAdminPassword
    diskEncryptionSetID: encryption.outputs.diskEncryptionSetID
    //envType: envType
   }
}

module encryption 'modules/encryption.bicep' = {
  name: 'encryption'
  params: {
    location: location
    secretAdminLogin: secretAdminLogin
    secretAdminPassword: secretAdminPassword
    keyVaultName: 'keyVault-${uniqueString(deploymentName)}'

    //envType: envType
   }
}

module backup 'modules/backup.bicep' = {
  name: 'backup'
  params: {
    location: location
    vmWebServerName: webServer.outputs.vmWebServerName
    vmWebServerId: webServer.outputs.vmWebServerId
    //envType: envType
   }
}
