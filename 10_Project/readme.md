<h1 align="center">Project Cloud Transition To Azure</h1>
<i>IaC deployment using Bicep</i>
<p align="center">
  <i>With Azure Bicep</i>
  <br/>
  <img width="160" src="https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/azure-original-wordmark.svg"/>
  <br/>

  <b>
  <a href="https://github.com/techgrounds/techgrounds-kaman/blob/main/10_Project/v1.1/docs/design_document.md">Design Document</a></b> | <b><a href="https://github.com/techgrounds/techgrounds-kaman/tree/main/10_Project/v1.1/src">Deployment Scripts</a></b> | <b><a href="https://github.com/techgrounds/techgrounds-kaman/blob/main/10_Project/v1.1/docs/user_stories.md">User Stories</a>
  </b>
  <br/>
  <br/>
  <a><img src="https://img.shields.io/badge/Bicep_CLI-0.21.1-green?style=flat-square" alt="Bicep CLI version 0.21.1">
  </a> <a><img src="https://img.shields.io/github/v/release/techgrounds/techgrounds-kaman?style=flat-square" alt="Release"></a> <a><img src="https://img.shields.io/github/commit-activity/w/techgrounds/techgrounds-kaman?style=flat-square" alt="Commit activity"></a>
</p>


### Overview

This manual describes how to deploy the Azure infrastructure I've created for my final project using Bicep. Bicep is a declarative language for deploying Azure resources.

### Setup
1. Ensure you have the latest version of Powershell installed. 
2. Install the [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-windows?tabs=azure-cli)
3. Open a Powershell terminal and install the Bicep CLI.
  `Winget install Microsoft.Bicep`
4. Login to your Azure account with the command below and follow the instructions.
  `az login`
5. Create a resource group to deploy the resources to using this command. Replace the region and resource group name.  
  `az group create -l <region> -n <resource_group_name>`


### Configuration
Download the latest release [here](https://github.com/techgrounds/techgrounds-kaman/releases) and extract the files to your local pc.

The Bicep files contains parameters that you may want to configure before running the deployment. One of these parameters is the trusted IP address that can access the management server. The management server is only accessible from a trusted IP address, so you must add your own IP address to the `main.bicep` file before running the deployment.

Open the `main.bicep` file and find and edit the following line:

`param trustedIP string = '<put_in_your_ip_address_here>`

<details open>
  <summary>Contents of <i>deploy</i> directory</summary>
  <p>
    <pre>
    v1.1
      └───deploy
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


### Running the deployment
In the PowerShell terminal, navigate to the directory where you extracted the files. Then, run the following command:

`az deployment group create -g <resource_group_name> -f main.bicep -n <deployment_name>`

Change the `<resource_group_name>` to the name of the resource group you have created earlier. Give a name to the deployment by changing `<deployment-name>`.

> [!IMPORTANT]  
> The `<deployment_name>` is important because the script uses it to generate a unique name for the key vault.

During deployment, you will be prompted to enter a username and password. This username and password will be used for both the web server and the management server. Please enter a password that is at least 8 characters long and includes a combination of uppercase letters, lowercase letters, and numbers.

> [!NOTE] 
> The deployment will take about 8 minutes to complete. Then, it may take an additional 1-2 minutes for the website to become accessible.