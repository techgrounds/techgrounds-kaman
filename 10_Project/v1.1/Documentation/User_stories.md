# User stories for v1.1


---
| Requirement  |Enhanced security by limiting direct access to the web server. |
|---|---|
|Epic   |v1.1   |
|Description   | The client wants the web server to not be directly accessible from the internet and desires the implementation of a proxy server.  |
|Deliverable   | An Application Gateway that acts as a reverse proxy between the internet user and the web server. The App Gateway will have a public ip attached to it. |

---
| Requirement  |Ensuring all connections are secured using HTTPS.|
|---|---|
|Epic   |v1.1   |
|Description   | Automatic upgrade of HTTP connections to HTTPS when connecting with the load balancer. |
|Deliverable   | Configuration ensuring all HTTP connections are automatically upgraded to HTTPS. |
---
| Requirement  |A secure connection with the latest security standards.|
|---|---|
|Epic   |v1.1   |
|Description   | The connection must be secured with at least TLS 1.2 or higher.|
|Deliverable   | TLS 1.2 or higher is implemented and configured by using a self-signed certificate. |
---
| Requirement  |Assurance that the web server is functioning correctly and timely identification of potential issues.|
|---|---|
|Epic   |v1.1   |
|Description   | The web server should undergo regular ‘health checks’.|
|Deliverable   | An implemented and configured health check system for the web server. |

---

| Requirement  |Minimal downtime and assurance that server issues are automatically addressed.|
|---|---|
|Epic   |v1.1   |
|Description   | Should the web server fail a health check, it should be automatically recovered.|
|Deliverable   | A configured automatic recovery system for the web server.|
---
| Requirement  |The ability to handle increased traffic without loss of service.|
|---|---|
|Epic   |v1.1   |
|Description   | Under sustained load, a temporary additional server should be initiated, with a maximum of 3 total servers.|
|Deliverable   | A configured and implemented autoscaling system.
|