# User stories for v1.1


---
| Requirement  |Enhanced security by limiting direct access to the web server. |
|---|---|
|Epic   |v1.1   |
|Description   | The client wants the web server to not be directly accessible from the internet and desires the implementation of a proxy server.  |
|Deliverable   | IaC-code for a configured proxy server between the internet user and the web server. |

---
| Requirement  |Ensuring all connections are secured using HTTPS.|
|---|---|
|Epic   |v1.1   |
|Description   | Automatic upgrade of HTTP connections to HTTPS when connecting with the load balancer. |
|Deliverable   | IaC-code for configuration ensuring all HTTP connections are automatically upgraded to HTTPS. |
---
| Requirement  |A secure connection with the latest security standards.|
|---|---|
|Epic   |v1.1   |
|Description   | The connection must be secured with at least TLS 1.2 or higher.|
|Deliverable   | IaC-code for implementing and configuring TLS 1.2 or higher. |
---
| Requirement  |Assurance that the web server is functioning correctly and timely identification of potential issues.|
|---|---|
|Epic   |v1.1   |
|Description   | The web server should undergo regular ‘health checks’.|
|Deliverable   |  IaC-code for an implemented and configured health check system for the web server.|

---

| Requirement  |Minimal downtime and assurance that server issues are automatically addressed.|
|---|---|
|Epic   |v1.1   |
|Description   | Should the web server fail a health check, it should be automatically recovered.|
|Deliverable   |  IaC-code for configuring an automatic recovery system for the web server.|
---
| Requirement  |The ability to handle increased traffic without loss of service.|
|---|---|
|Epic   |v1.1   |
|Description   | Under sustained load, a temporary additional server should be initiated, with a maximum of 3 total servers.|
|Deliverable   | IaC-code for configuring and implementing an autoscaling system.|