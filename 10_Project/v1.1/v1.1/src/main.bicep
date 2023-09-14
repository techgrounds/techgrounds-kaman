@description('The environment type of this deployment')
@allowed([
  'dev'
  'prod'
])
param envType string = 'dev'
//param managementSvrIP string
param location string = resourceGroup().location
param deploymentName string = deployment().name //for randomizing name of resources

// Ask for admin login and password
@description('Username for admin login')
@secure()
param secretAdminUserName string

@description('Password for admin login')
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

module webFarm 'modules/webFarm.bicep' = {
  name: 'webFarm'
  params: {
    location: location
    vnet2Subnet1Id: virtualnetworks.outputs.vnet2Subnet1Id
    vnet2Subnet2Id: virtualnetworks.outputs.vnet2Subnet2Id
    secretAdminUserName: secretAdminUserName
    secretAdminPassword: secretAdminPassword
    diskEncryptionSetID: encryption.outputs.diskEncryptionSetID

    //envType: envType
   }
}

module managementServer 'modules/vmManagementServer.bicep' = {
  name: 'managementServer'
  params: {
    location: location
    vnet1Subnet1Id: virtualnetworks.outputs.vnet1Subnet1Id
    secretAdminUserName: secretAdminUserName
    secretAdminPassword: secretAdminPassword
    diskEncryptionSetID: encryption.outputs.diskEncryptionSetID
    //envType: envType
   }
}

module encryption 'modules/encryption.bicep' = {
  name: 'encryption'
  params: {
    location: location
    secretAdminUserName: secretAdminUserName
    secretAdminPassword: secretAdminPassword
    keyVaultName: 'keyVault-${uniqueString(deploymentName)}'

    //envType: envType
   }
}
/*
module backup 'modules/backup.bicep' = {
  name: 'backup'
  params: {
    location: location
    vmWebServerName: webServer.outputs.vmWebServerName
    vmWebServerId: webServer.outputs.vmWebServerId
    //envType: envType
   }
}
*/
