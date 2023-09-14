param storageAccountName string = 'storage${uniqueString(resourceGroup().id)}'
param location string
param containerName string = 'scripts'
param managedId string
param keyVaultUri string
param diskEncryptionKeyName string

@allowed([
  'dev'
  'prod'
])
param envType string

var storageAccountSkuName = (envType == 'prod') ? 'Standard_GRS' : 'Standard_LRS'

//--------------------------------------
// Storage Account
// encrytped with CMK (managed Identity)
//--------------------------------------
resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: storageAccountSkuName
  }
  kind: 'StorageV2'
  identity: {
    type: 'UserAssigned'
    userAssignedIdentities: {
      '${managedId}': {}
    }
  }
  properties: {
    accessTier: 'Hot'
    allowBlobPublicAccess: false
    publicNetworkAccess:'Disabled'
    minimumTlsVersion: 'TLS1_2'
    
    networkAcls: {
      bypass: 'AzureServices'
      virtualNetworkRules: []
      ipRules: []
      defaultAction: 'Deny'
    }
    encryption: {
      identity: {
        userAssignedIdentity: managedId
      }
      requireInfrastructureEncryption:true
      keyvaultproperties: {
        keyname: diskEncryptionKeyName
        keyvaulturi: keyVaultUri
      }
      keySource: 'Microsoft.Keyvault'
    }
  }
}

//---------------
// Blob container
//---------------
resource Blobcontainer 'Microsoft.Storage/storageAccounts/blobServices/containers@2023-01-01' = { 
  name: '${storageAccount.name}/default/${containerName}' 
  properties: {
    publicAccess: 'None'

  }
}
