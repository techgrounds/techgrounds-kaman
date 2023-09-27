<h1 align="center">Project Cloud Transition v1.1</h1>
<p align="center">
  <i></i>
   <br/>
  <img width="140" src="https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/azure-original-wordmark.svg"/>
  <br/>
  <b><a href="https://github.com/techgrounds/techgrounds-kaman/blob/main/10_Project/v1.1/docs/design%20documentation.md">Design Document</a></b> | <b><a href="https://github.com/techgrounds/techgrounds-kaman/tree/main/10_Project/v1.0%20mvp/src">Deployment Scripts</a></b> | <b><a href="https://github.com/techgrounds/techgrounds-kaman/blob/main/10_Project/v1.1/docs/user_stories.md">User Stories</a>
  <br/><br/>
  <a>
    <img src="https://img.shields.io/badge/Bicep_CLI-0.20.4-green?style=flat-square" alt="Bicep CLI version 0.20.4">
  </a>
   <a>
    <img src="https://img.shields.io/github/v/release/techgrounds/techgrounds-kaman?style=flat-square" alt="Release">
  </a>
  </a>
   <a>
    <img src="https://img.shields.io/github/commit-activity/w/techgrounds/techgrounds-kaman?style=flat-square" alt="Commit activity">
  </a>
</p>

### Overview
This manual describes how to deploy an Azure infrastructure using a Bicep file. Bicep is a declarative language for deploying Azure resources. 

### Setup
1. Ensure you have the latest version of Powershell installed.
2. Install the Bicep CLI.
3. Login to your Azure account 
  `az login`
4. Create a resource group to deploy the resources to using this command. Replace the region and resource group name.  
  `az group create -l <region> -n <resource_group_name>`


### Configuration
Download everything in the `v1.1` directory (including sub directories) to your local pc.


<details open>
  <summary>Contents of <i>src</i> directory</summary>
  <p>
    <pre>
    v1.1
      └───src
          │   main.bicep
          │
          ├───certs
          │       serverCert.pfx
          │
          ├───init
          │       init_webserver.sh
          │
          └───modules
                  encryption.bicep
                  network.bicep
                  storageAccount.bicep
                  vmManagementServer.bicep
                  webFarm.bicep
    </pre>
</p>
</details>
The Bicep file contain parameters that you might need to configure before running the deployment.

### Running the deployment

` az deployment group create -g <resource_group_name> -f main.bicep -n <deploymentname>`
