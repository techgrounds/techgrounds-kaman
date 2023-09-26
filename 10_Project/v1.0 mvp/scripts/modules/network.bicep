// Parameters
param location string
param vnet1Name string = 'management-prd-vnet'
param vnet2Name string = 'web-prd-vnet'

// Allowed ip address for accessing the management server
param trustedIP string = '172.0.0.1' //change to your ip adres

// Generate subnet names
var vnet1SubnetName = '${vnet1Name}-subnet'
var vnet2SubnetName = '${vnet2Name}-subnet'

// Generate NSG names
var vnet1NSGName = '${vnet1Name}-nsg'
var vnet2NSGName = '${vnet2Name}-nsg'

var vnet1Config = {
  addressSpacePrefix: '10.10.10.0/24'
  subnetPrefix: '10.10.10.0/24'
}
var vnet2Config = {
  addressSpacePrefix: '10.20.20.0/24'
  subnetPrefix: '10.20.20.0/24'
}

//VNet1
resource vnet1 'Microsoft.Network/virtualNetworks@2023-04-01' = {
  name: vnet1Name
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnet1Config.addressSpacePrefix
      ]
    }
    subnets: [
      {
        name: vnet1SubnetName
        properties: {
          addressPrefix: vnet1Config.subnetPrefix
          networkSecurityGroup: {
            id:vnet1NSG.id
          }
        }
      }
    ]
  }
}

// Peering VNet1 - Vnet2
resource vnet1Peering 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2023-04-01' = {
  parent: vnet1
  name: '${vnet1Name}-${vnet2Name}'
  properties:{
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: false
    allowGatewayTransit: false
    useRemoteGateways: false
    remoteVirtualNetwork:{
      id: vnet2.id
    }
  }
}

// VNet2
resource vnet2 'Microsoft.Network/virtualNetworks@2023-04-01' = {
  name: vnet2Name
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnet2Config.addressSpacePrefix
      ]
    }
    subnets: [
      {
        name: vnet2SubnetName
        properties: {
          addressPrefix: vnet2Config.subnetPrefix
          networkSecurityGroup: {
            id:vnet2NSG.id
          }
        }
      }
    ]
  }
}

// Peering VNet2 - Vnet1
resource vnet2Peering 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2023-04-01' = {
  parent: vnet2
  name: '${vnet2Name}-${vnet1Name}'
  properties:{
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: false
    allowGatewayTransit: false
    useRemoteGateways: false
    remoteVirtualNetwork:{
      id: vnet1.id
    }
  }
}

@description('Vnet of the Management Server')
resource vnet1NSG 'Microsoft.Network/networkSecurityGroups@2023-04-01' = {
  name: vnet1NSGName
  location: location
  properties:{
    securityRules: [
      {
        name: 'allowSSHFromTrustedIP'
        properties:{
          priority: 100
          access: 'Allow'
          direction: 'Inbound'
          destinationPortRange: '22'
          protocol: 'Tcp'
          sourcePortRange: '*'
          sourceAddressPrefix: trustedIP
          destinationAddressPrefix: '*'
        }
      }
      {
        name: 'allowRDPFromTrustedIP'
        properties:{
          priority: 101
          access: 'Allow'
          direction: 'Inbound'
          destinationPortRange: '3389'
          protocol: 'Tcp'
          sourcePortRange: '*'          
          sourceAddressPrefix: trustedIP
          destinationAddressPrefix: '*'
        }
      }
    ]
  }

}

@description('Vnet of the Web Server')
resource vnet2NSG 'Microsoft.Network/networkSecurityGroups@2023-04-01' = {
  name: vnet2NSGName
  location: location
  properties:{
    securityRules: [
      {
        name: 'AllowHTTP'
        properties:{
          priority: 100
          access: 'Allow'
          direction: 'Inbound'
          destinationPortRange: '80'
          protocol: 'Tcp'
          sourcePortRange: '*'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
        }
      }
      {
        name: 'AllowHTTPS'
        properties:{
          priority: 110
          access: 'Allow'
          direction: 'Inbound'
          destinationPortRange: '443'
          protocol: 'Tcp'
          sourcePortRange: '*'          
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
        }
      }
      {
        name: 'OnlyAllowSSHFromManagementSvr'
        properties:{
          priority: 120
          access: 'Allow'
          direction: 'Inbound'
          destinationPortRange: '22'
          protocol: 'Tcp'
          sourcePortRange: '*'          
          sourceAddressPrefix: '10.10.10.10' //ip of management server
          destinationAddressPrefix: '*'
        }
      }
    ]
  }

}
output subnet1Id string = vnet1.properties.subnets[0].id
output subnet2Id string = vnet2.properties.subnets[0].id
