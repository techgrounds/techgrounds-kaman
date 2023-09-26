param location string
param vmWebServerName string
param vmWebServerId string

param vaultName string = 'RecoveryVault'

var backupFabric = 'Azure'
var backupPolicyName = 'DefaultPolicy'
var protectionContainer = 'iaasvmcontainer;iaasvmcontainerv2;${resourceGroup().name};${vmWebServerName}'
var protectedItem = 'vm;iaasvmcontainerv2;${resourceGroup().name};${vmWebServerName}'
var scheduleRunTimes = [
  '2024-01-01T02:00:00Z'
]

//------------------------------
// Create recovery service vault
//------------------------------

resource recoveryServicesVault 'Microsoft.RecoveryServices/vaults@2023-04-01' = {
  name: vaultName
  location: location
  sku: {
    name: 'RS0'
    tier: 'Standard'
  }
  properties: {
    publicNetworkAccess: 'Disabled'
  }
}

//--------------------------------------------------------
// The protected item. Setup a backup policy for the webserver
//--------------------------------------------------------
resource vaultName_backupFabric_protectionContainer_protectedItem 'Microsoft.RecoveryServices/vaults/backupFabrics/protectionContainers/protectedItems@2023-04-01' = {
  name: '${vaultName}/${backupFabric}/${protectionContainer}/${protectedItem}'
  properties: {
    protectedItemType: 'Microsoft.Compute/virtualMachines'
    policyId: '${recoveryServicesVault.id}/backupPolicies/${backupPolicyName}'
    sourceResourceId: vmWebServerId
  }
} 

//------------------------------------------------
// Backup Policy:
// daily backups at 00:00 hours/ 7 day retention
//------------------------------------------------
resource backupPolicy 'Microsoft.RecoveryServices/vaults/backupPolicies@2023-04-01' = {
  parent: recoveryServicesVault
  name: backupPolicyName
  location: location
  properties: {
    backupManagementType: 'AzureIaasVM'
    instantRpRetentionRangeInDays: 5
    schedulePolicy: {
      scheduleRunFrequency: 'Daily'
      scheduleRunTimes: scheduleRunTimes
      schedulePolicyType: 'SimpleSchedulePolicy'
    }
    retentionPolicy: {
      dailySchedule: {
        retentionTimes: scheduleRunTimes
        retentionDuration: {
          count: 7
          durationType: 'Days'
        }
      }
      retentionPolicyType: 'LongTermRetentionPolicy'
    }
    timeZone: 'W. Europe Standard Time' //https://learn.microsoft.com/en-us/azure/azure-sql/managed-instance/timezones-overview?view=azuresql
  }
}
