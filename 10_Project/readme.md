<h1 align="center">Project Cloud Transition v1.1</h1>
<p align="center">
  <i></i>
   <br/>
  <img width="160" src="https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/azure-original-wordmark.svg"/> <img width="80" src="https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/BicepLogoImage.svg"/>
  <br/>
  <b><a href="https://github.com/techgrounds/techgrounds-kaman/blob/main/10_Project/v1.1/docs/design%20documentation.md">Design Document</a></b> | <b><a href="https://github.com/techgrounds/techgrounds-kaman/tree/main/10_Project/v1.0%20mvp/src">Deployment Scripts</a></b>
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

<pre>
📦src
 ┣ 📂certs
 ┃ ┣ 📜rootCA.cer
 ┃ ┣ 📜rootCA.csr
 ┃ ┣ 📜rootCA.key
 ┃ ┣ 📜serverCert.cer
 ┃ ┣ 📜serverCert.csr
 ┃ ┣ 📜serverCert.key
 ┃ ┗ 📜serverCert.pfx
 ┣ 📂init
 ┃ ┗ 📜init_webserver.sh
 ┣ 📂modules
 ┃ ┣ 📜backup.bicep
 ┃ ┣ 📜encryption.bicep
 ┃ ┣ 📜network.bicep
 ┃ ┣ 📜storageAccount.bicep
 ┃ ┣ 📜vmManagementServer.bicep
 ┃ ┗ 📜webFarm.bicep
 ┗ 📜main.bicep
</pre>