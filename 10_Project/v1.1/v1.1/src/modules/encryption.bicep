param location string
param managedIDName string = 'keyVaultIdentity'

param keyVaultName string
param diskEncryptionSetName string = 'diskEncryptionSet'

@description('Username for admin login')
@secure()
param secretAdminUserName string

@description('Password for admin login')
@secure()
param secretAdminPassword string

//-----------------------------------------
// Add admin username/password to key vault
//-----------------------------------------
resource adminUserNametoKV 'Microsoft.KeyVault/vaults/secrets@2023-02-01' = {
  parent: keyVault
  name: 'AdminUserName'
  properties: {
    value: secretAdminUserName
  }
}

resource adminPasswordtoKV 'Microsoft.KeyVault/vaults/secrets@2023-02-01' = {
  parent: keyVault
  name: 'AdminPassword'
  properties: {
    value: secretAdminPassword
  }
}

//------------------
// Managed Identity
//------------------
resource managedIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: managedIDName
  location: location
}

//----------------
// Azure Key Vault
//----------------
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  properties: {
    tenantId: subscription().tenantId
    sku: {
      family:'A'
      name:'standard'
    }
    enabledForDeployment: true
    enabledForDiskEncryption: true
    enabledForTemplateDeployment: true
    enablePurgeProtection: true
    enableSoftDelete: true
    enableRbacAuthorization: false
    softDeleteRetentionInDays: 7 //90
    
    networkAcls: {
      bypass: 'AzureServices'
      defaultAction: 'Allow'
      ipRules: []
    }
    accessPolicies: [
      {
        objectId: managedIdentity.properties.principalId
        tenantId: tenant().tenantId
        permissions: {
          certificates: [
            'all'
          ]
          keys: [
            'get'
            'wrapKey'
            'unwrapKey'
            'encrypt'
            'decrypt'
          ]
          secrets: [
            'all'
          ]
        }
      }
    ]
  }
}
//-----------------------
// Generate a key in key vault
//-----------------------
resource diskEncryptionKey 'Microsoft.KeyVault/vaults/keys@2023-02-01' = {
  parent: keyVault
  name: 'diskEncryptionKey'
  properties: {
    kty: 'RSA'
    keySize: 2048
    keyOps: [
      'encrypt'
      'decrypt'
      'sign'
      'verify'
      'wrapKey'
      'unwrapKey'
    ]
  }
}

//--------------------
// Disk Encryption Set
//--------------------
resource diskEncryptionSet 'Microsoft.Compute/diskEncryptionSets@2023-01-02' = {
  name: diskEncryptionSetName
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    activeKey: {
      sourceVault: {
        id: keyVault.id
      }
      keyUrl: diskEncryptionKey.properties.keyUriWithVersion
    }
    rotationToLatestKeyVersionEnabled: true
    encryptionType: 'EncryptionAtRestWithCustomerKey'
  }
}

resource accessPolicy 'Microsoft.KeyVault/vaults/accessPolicies@2023-02-01' = {
  parent: keyVault
  name: 'add' //add, remove,replace
  properties: {
    accessPolicies: [
      {
        objectId: diskEncryptionSet.identity.principalId
        permissions: {
          keys: [
            'get'
            'wrapKey'
            'unwrapKey'
            'encrypt'
            'decrypt'
          ]
        }
        tenantId: subscription().tenantId
      }
      {
        objectId: managedIdentity.properties.principalId
        permissions: {
          keys: [
            'all'
          ]
        }
        tenantId: subscription().tenantId
      }
    ]
  }
}

output diskEncryptionSetID string = diskEncryptionSet.id
output managedId string = managedIdentity.id
output diskEncryptionKeyName string = diskEncryptionKey.name
output keyVaultUri string = keyVault.properties.vaultUri
