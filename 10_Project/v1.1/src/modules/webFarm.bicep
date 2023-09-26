// Parameters
param location string
param availabilityZone string = '2'
param diskEncryptionSetID string
param envType string

@secure()
param secretAdminUserName string
@secure()
param secretAdminPassword string

param vnet2Subnet1Id string
param vnet2Subnet2Id string

var appGatewayName = 'AppGateway'


@description('VM Size')
param vmSku string = 'Standard_B1ls'

var vmScaleSetName = 'vmScaleSet'

@description('Number of VM instances (3 or less).')
@minValue(1)
@maxValue(3)
param instanceCount int = 1

var osType = {
  publisher: 'Canonical'
  offer: '0001-com-ubuntu-server-jammy'
  sku: '22_04-lts-gen2'
  version: 'latest'
}

//--------------------------
// Virtual Machine Scale Set
//--------------------------
resource vmScaleSet 'Microsoft.Compute/virtualMachineScaleSets@2023-07-01' = {
  name: vmScaleSetName
  location: location
  zones: [
    availabilityZone
  ]
  sku: {
    name: vmSku
    tier: 'Standard'
    capacity: instanceCount
  }
  properties: {
    overprovision: true
    upgradePolicy: {
      mode: 'Automatic'
    }
    singlePlacementGroup: false
    //platformFaultDomainCount: 1
    automaticRepairsPolicy: {
      enabled: true
      gracePeriod: 'PT10M'
    }
    virtualMachineProfile: {
      storageProfile: {
        osDisk: {
          createOption: 'FromImage'
          caching: 'ReadWrite'
          managedDisk: {
            storageAccountType: 'Standard_LRS'
            diskEncryptionSet: {
              id: diskEncryptionSetID
            }
          }
        }
        imageReference: osType
      }
      osProfile: {
        computerNamePrefix: '${vmScaleSetName}-${envType}'
        adminUsername: secretAdminUserName
        adminPassword: secretAdminPassword
        customData: loadFileAsBase64('../init/init_testing.sh')
      }
      securityProfile: {
        encryptionAtHost: true
      }
      networkProfile: {
        networkInterfaceConfigurations: [
          {
            name: '${vmScaleSetName}NIC'
            properties: {
              primary: true
              ipConfigurations: [
                {
                  name: '${vmScaleSetName}ipconfig'
                  properties: {
                    subnet: {
                      id: vnet2Subnet1Id
                    }
                    applicationGatewayBackendAddressPools: [
                      {
                        id: appGateway.properties.backendAddressPools[0].id
                        //id: resourceId('Microsoft.Network/applicationGateways/backendAddressPools', appGatewayName, 'backendPool')
                      }
                    ]
                  }
                }
              ]
            }
          }
        ]
      }
      extensionProfile:{
        extensions: [
          {
            name: 'HealthExtension'
            properties: {
              //enableAutomaticUpgrade: false
              publisher: 'Microsoft.ManagedServices'
              type: 'ApplicationHealthLinux'
              autoUpgradeMinorVersion: true
              typeHandlerVersion: '1.0'
              settings: {
                protocol: 'http'
                port: 80 //80
                requestPath: '/'
              }
            }
          }
        ]
      }
    }
  }
  dependsOn:[
    publicIPAddress
    //appGateway
  ]
}

//------------------
// Setup Autoscaling
//------------------
resource autoscalehost 'Microsoft.Insights/autoscalesettings@2022-10-01' = {
  name: 'autoscalehost'
  location: location
  properties: {
    name: 'autoscalehost'
    targetResourceUri: vmScaleSet.id
    enabled: true
    profiles: [
      {
        name: 'Profile1'
        capacity: {
          minimum: '1'
          maximum: '3'
          default: '1'
        }
        rules: [
          {
            metricTrigger: {
              metricName: 'Percentage CPU'
              metricResourceUri: vmScaleSet.id
              timeGrain: 'PT1M'
              statistic: 'Average'
              timeWindow: 'PT5M'
              timeAggregation: 'Average'
              operator: 'GreaterThan'
              threshold: 75
            }
            scaleAction: {
              direction: 'Increase'
              type: 'ChangeCount'
              value: '1'
              cooldown: 'PT5M'
            }
          }
          {
            metricTrigger: {
              metricName: 'Percentage CPU'
              metricResourceUri: vmScaleSet.id
              timeGrain: 'PT1M'
              statistic: 'Average'
              timeWindow: 'PT5M'
              timeAggregation: 'Average'
              operator: 'LessThan'
              threshold: 30
            }
            scaleAction: {
              direction: 'Decrease'
              type: 'ChangeCount'
              value: '1'
              cooldown: 'PT5M'
            }
          }
        ]
      }
    ]
  }
}

//----------------------------------
// Public IP for Application Gateway
//----------------------------------
resource publicIPAddress 'Microsoft.Network/publicIPAddresses@2023-05-01' = {
  name: '${appGatewayName}PublicIp'
  location: location
  sku: {
    name: 'Standard'
  }
  properties: {
    publicIPAddressVersion: 'IPv4'
    publicIPAllocationMethod: 'Static'
    idleTimeoutInMinutes: 4
  }
}

//--------------------
// Application Gateway
//--------------------
resource appGateway 'Microsoft.Network/applicationGateways@2023-05-01' = {
  name: appGatewayName
  location: location
  properties: {
    sku: {
      name: 'Standard_v2' //Standard_v2
      tier: 'Standard_v2' 
      capacity: 1 // Specify Either Capacity Or AutoscaleConfiguration
    }
    gatewayIPConfigurations: [
      {
        name: 'appGatewayIpConfig'
        properties: {
          subnet: {
            id: vnet2Subnet2Id
          }
        }
      }
    ]
    sslCertificates: [
      {
        name: 'serverCertificate'
        properties:{
          data: loadFileAsBase64('../certs/serverCert.pfx')
          password: 'abc123'
        }
      }
    ]
    frontendIPConfigurations: [
      {
        name: 'appGwPublicFrontendIp'
        properties:{
          //privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: publicIPAddress.id
          }
        }
      }
    ]
    frontendPorts: [
      {
        name: 'port_80'
        properties: {
          port: 80
        }
      }
      {
        name: 'port_443'
        properties:{
          port: 443
        }
      }
    ]
    backendAddressPools: [
      {
        name: 'backendPool'
        properties: {}
      }
    ]
    backendHttpSettingsCollection: [
      {
         name: 'HTTP-Setting'
         properties: {
          port: 80
          protocol: 'Http'
          cookieBasedAffinity: 'Disabled'
          pickHostNameFromBackendAddress: false
          requestTimeout: 20
         }
      }
      {
        name: 'HTTPS-Setting'
        properties: {
          port: 443
          protocol: 'Https'
          cookieBasedAffinity: 'Disabled'
          pickHostNameFromBackendAddress: false
          requestTimeout: 20
         }
      }
    ]
    httpListeners: [
      {
        name: 'listener-HTTP'
        properties: {
          frontendIPConfiguration: {
            id: resourceId('Microsoft.Network/applicationGateways/frontendIPConfigurations', appGatewayName, 'appGwPublicFrontendIp')
          }
          frontendPort: {
            id: resourceId('Microsoft.Network/applicationGateways/frontendPorts', appGatewayName, 'port_80')
          }
          protocol: 'Http'
          requireServerNameIndication: false
        }
      }
      {
        name: 'listener-HTTPS'
        properties: {
          frontendIPConfiguration: {
            id: resourceId('Microsoft.Network/applicationGateways/frontendIPConfigurations', appGatewayName, 'appGwPublicFrontendIp')
          }
          frontendPort: {
            id: resourceId('Microsoft.Network/applicationGateways/frontendPorts', appGatewayName, 'port_443')
          }
          protocol: 'Https'
          sslCertificate: {
            id: resourceId('Microsoft.Network/applicationGateways/sslCertificates', appGatewayName, 'serverCertificate')
          }
        }
      }
    ]
    requestRoutingRules: [
      {
        name: 'Routingrule'
        properties: {
          ruleType: 'Basic'
          httpListener: {
            id: resourceId('Microsoft.Network/applicationGateways/httpListeners', appGatewayName, 'listener-HTTPS')
          }
          backendAddressPool: {
            id: resourceId('Microsoft.Network/applicationGateways/backendAddressPools', appGatewayName, 'backendPool')
          }
          backendHttpSettings: {
            id: resourceId('Microsoft.Network/applicationGateways/backendHttpSettingsCollection', appGatewayName, 'HTTP-Setting')
          }
          priority: 100
        }
      }
      {
        name: 'HTTP-To-HTTPS'
        properties: {
          ruleType: 'Basic'
          httpListener: {
            id: resourceId('Microsoft.Network/applicationGateways/httpListeners', appGatewayName, 'listener-HTTP')
          }
          redirectConfiguration: {
            id: resourceId('Microsoft.Network/applicationGateways/redirectConfigurations', appGatewayName, 'redirect-HTTP-To-HTTPS')
          }
          priority: 110
        }
      }
    ]
    redirectConfigurations: [
      {
        name: 'redirect-HTTP-To-HTTPS'
        properties: {
          redirectType: 'Permanent'
          targetListener: {
            id: resourceId('Microsoft.Network/applicationGateways/httpListeners', appGatewayName, 'listener-HTTPS')
          }
          includePath: true
          includeQueryString: true
        }
      }
    ]
    enableHttp2: false
    //autoscaleConfiguration:{
      //minCapacity: 1
      //maxCapacity: 3
    //}
  }
}
