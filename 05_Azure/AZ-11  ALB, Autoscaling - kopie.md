# Azure Load Balancer (ALB) & Auto Scaling
Azure Load Balancer is a highly scalable, fully managed service from Microsoft that helps distribute network traffic evenly across various services in Azure, such as Virtual Machines. It allows your applications to handle large amounts of traffic and is an essential component in designing scalable and highly available applications in Azure.

Azure Autoscaling is a service in Azure that allows applications to perform optimally by automatically adjusting resources based on demand. It enables your applications to maintain high performance during peak traffic times and reduce costs by scaling down resources during off-peak times. Azure Autoscale uses a set of predefined rules and metrics such as CPU usage or memory demand to trigger scaling actions, ensuring that you have the right amount of resources at any given time.

## Key-terms
- Autoscaling
- VM Scale Set - Azure virtual machine scale sets let you create and manage a group of load balanced VMs. The number of VM instances can automatically increase or decrease in response to demand or a defined schedule. Scale sets provide high availability to your applications, and allow you to centrally manage, configure, and update a large number of VMs.

- Azure Monitor
- Azure Load Balancer (ALB)
- Application Gateway (L7) - A web traffic load balancer that enables you to manage traffic to your web applications. 
Features:
    - URL based routing - (/images/* or /videos/*)
    - Secure Sockets Layer (SSL/TLS) termination - is the process where services like Azure Application Gateway or Azure Front Door handle the decoding of SSL/TLS encrypted connections, freeing up backend server resources and improving efficiency and security in Azure application deployments.
    - Autoscaling support
    - Zone redundancy - Application Gateway can span multiple Availability Zones.
    - Web Application Firewall - a service that provides centralized, scalable protection for your web applications from common exploits and vulnerabilities by filtering and monitoring HTTP traffic to and from a web application.
    - Many more


## Opdracht
### Gebruikte bronnen
- https://learn.microsoft.com/en-us/azure/load-balancer/load-balancer-overview
- https://www.youtube.com/watch?v=3ORD420WZcU
- https://learn.microsoft.com/en-us/azure/azure-monitor/autoscale/autoscale-overview
- https://www.cyberciti.biz/faq/stress-test-linux-unix-server-with-stress-ng/
- https://learn.microsoft.com/en-us/azure/load-testing/overview-what-is-azure-load-testing




### Ervaren problemen
Geen echte problemen ervaren.

### Resultaat
De webpagina is bereikbaar via het ipadres van de load balancer.

![Image](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/AZ-11_screen01.png)

stress test gestart op VM
![Image](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/AZ-11_screen02.png)

Er worden worden automatsich instances aangemaakt. Zie log:
![Image](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/AZ-11_screen03.png)


![Image](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/AZ-11_screen04.png)

De automatisch aangemaakte port mappings in de load balancer.
![Image](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/AZ-11_screen04.png)