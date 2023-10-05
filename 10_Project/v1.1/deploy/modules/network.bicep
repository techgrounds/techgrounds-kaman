// Parameters
param location string
param vnet1Prefix string = 'management'
param vnet2Prefix string = 'web'
param vnet2Subnet1NamePrefix string = 'webPool'
param vnet2Subnet2NamePrefix string = 'appGateway'
param envType string
param trustedIP string

// Vnet names
var vnet1Name = '${vnet1Prefix}-${envType}-vnet'
var vnet2Name = '${vnet2Prefix}-${envType}-vnet'


// Subnet names
var vnet1SubnetName = '${vnet1Name}-subnet'
var vnet2Subnet1Name = '${vnet2Subnet1NamePrefix}-subnet'
var vnet2Subnet2Name = '${vnet2Subnet2NamePrefix}-subnet'


// NSG names
var vnet1NSGName = '${vnet1Name}-nsg'
var vnet2NSG1Name = '${vnet2Subnet1NamePrefix}-nsg'
var vnet2NSG2Name = '${vnet2Subnet2NamePrefix}-nsg'

var vnet1Config = {
  addressSpacePrefix: '10.10.10.0/24'
  subnetPrefix: '10.10.10.0/24'
}
var vnet2Config = {
  addressSpacePrefix: '10.20.20.0/24'
  subnet1Prefix: '10.20.20.0/25'
  subnet2Prefix: '10.20.20.128/25'
}

//------------------
// Virtual Network 1
//------------------
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

//----------------------
// Peering VNet1 - Vnet2
//----------------------
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
//------------------
// Virtual Network 2
//------------------
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
        name: vnet2Subnet1Name
        properties: {
          addressPrefix: vnet2Config.subnet1Prefix
          networkSecurityGroup: {
            id:vnet2NSG1.id
          }
        }
      }
      {
        name: vnet2Subnet2Name
        properties: {
          addressPrefix: vnet2Config.subnet2Prefix
          networkSecurityGroup: {
            id:vnet2NSG2.id
          }
        }
      }
    ]
  }
}
//----------------------
// Peering VNet2 - Vnet1
//----------------------
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

//-----------------------------------------------------------
// NSG and security rules for "managementserver-subnet"
//-----------------------------------------------------------
@description('Vnet of the Management Server')
resource vnet1NSG 'Microsoft.Network/networkSecurityGroups@2023-04-01' = {
  name: vnet1NSGName
  location: location
  properties:{
    securityRules: [
      /*
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
      */
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

//-----------------------------------------------------
// NSG and security rules for "webserver-subnet"
//-----------------------------------------------------
@description('NSG of the Web Server')
resource vnet2NSG1 'Microsoft.Network/networkSecurityGroups@2023-04-01' = {
  name: vnet2NSG1Name
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
          sourceAddressPrefix: '10.10.10.10' //static ip of management server
          destinationAddressPrefix: '*'
        }
      }
    ]
  }

}

//-------------------------------------------------------
// NSG and security rules for "App Gateway-subnet"
//-------------------------------------------------------

@description('NSG of the App Gateway')
resource vnet2NSG2 'Microsoft.Network/networkSecurityGroups@2023-04-01' = {
  name: vnet2NSG2Name
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
        name: 'AllowAGPorts'
        properties:{
          priority: 120
          access: 'Allow'
          direction: 'Inbound'
          destinationPortRange: '65200-65535'
          protocol: 'Tcp'
          sourcePortRange: '*'          
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
        }
      }
    ]
  }
}
output vnet1Subnet1Id string = vnet1.properties.subnets[0].id // management server subnet
output vnet2Subnet1Id string = vnet2.properties.subnets[0].id // vm scale set
output vnet2Subnet2Id string = vnet2.properties.subnets[1].id // appGateway
output vnet1Id string = vnet1.id
