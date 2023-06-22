# Detection, response and analysis
The processes of detection, response, and analysis are essential to cybersecurity. They involve identifying security breaches, implementing the right measures to lessen their effects, and closely examining the event to avoid similar issues in the future.

- **Detection** involves spotting any signs of security threats or vulnerabilities in a system.  
- **Response** takes over to quickly address these threats and minimize their impact. 
- **Analysis** is about studying the incident in detail, understanding how it occurred, and learning how to better prevent such incidents in the future. This continuous cycle plays a critical role in enhancing and maintaining a system's security.

## Key-terms
- RPO - The Recovery Point Objective (RPO) is the maximum acceptable amount of data loss measured in time. Often means the time between 2 backups.
- RTO - The time it takes for the system to be up and running again after a failure.
- Intrusion Detection Systems (IDS) - Is a passive device designed to detect potential threats or attacks on a network. This is accomplished by monitoring network traffic and looking for suspicious activity, such as patterns typical of a malware infection or a hacking attempt. It alerts system administrators but doesn't take action to stop the activity itself

- Intrusion Prevention Systems (IPS) - Essentially an IDS that can also take action to prevent or stop detected threats (active). It can take pre-determined actions to neutralize the threat.This could include dropping suspicious data packets, blocking network traffic from identified malicious sources, or even disconnecting the affected devices from the network.

- Hacking Response Plan  - A cybersecurity response plan outlines the steps an organization must take when they identify a security breach or cyberattack. These steps can be broadly categorized into six phases:
    - Preparation -This is about having the right systems, protocols, and teams in place before a breach occurs. 
    - Identification -  Detecting and confirming the cyber incident.
    - Containment - Contain the threat to prevent further damage
    - Eradication - Find and eliminate the root cause of the attack
    - Recovery - Restoring systems and getting them back to normal operation.
    - Lessons Learned - Carry out a review of the incident. This involves analyzing what happened, what was done to resolve it, and what can be done better in the future.


- System Hardening - A collection of techniques and practices to reduce the vulnerability of a system. The goal is to minimize the attack surface and eliminate the potential points of entry an attacker could use. 
 Here are some key elements of system hardening:
  - Minimize Software to Reduce Vulnerability.
  - Patch Management
  - Encrypt Data 
  - Reduce privilege levels to the minimum required
  -  Implement strong access controls
 
  Different types of disaster recovery options:
  - Backup and Restore - This is the most basic form of disaster recovery. It involves regularly creating backups of data, which can then be restored in the event of a disaster. 
  - Pilot Light - Running a minimal version of the system in the cloud. In case of a disaster, this system can be rapidly scaled up to handle production workloads.
  - Warm site - A warm site is a duplicate of the original production environment, including hardware and software, that is always up and running. However, it might not have the most current data. In the event of a disaster, data is restored from backups and the warm site becomes the new production environment.
  - Hot site - A hot site is a fully redundant and operational offsite location that mirrors your current production environment. It includes real-time replication of data. In the event of a disaster, traffic is switched to the hot site which functions as the production environment, 
  - Disaster Recovery as a Service (DRaaS) - This is a cloud-based service provided by a third-party vendor that manages disaster recovery.

    
## Opdracht
### Gebruikte bronnen
- ChatGPT
- [[Youtube] What is an RPO and RTO? and why you NEED to understand them as a Solutions Architect](https://www.youtube.com/watch?v=KesoHnsZWoAg)
- https://ipwithease.com/firewall-vs-ips-vs-ids/
- https://www.grcilaw.com/blog/what-is-cyber-incident-response#:~:text=Many%20organisations%20use%20NIST's%20Computer,eradication%2C%20recovery%20and%20lessons%20learned.
- https://ubuntu.com/blog/what-is-system-hardening-definition-and-best-practices

![Image](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/SEC-08_screen01.png)

### Ervaren problemen
No problems, just lots of reading.

### Resultaat
- *A Company makes daily backups of their database. The database is automatically recovered when a failure happens using the most recent available backup. The recovery happens on a different physical machine than the original database, and the entire process takes about 15 minutes. What is the RPO of the database?*

The company is making daily backups. So if a failure occurs, the maximum data loss could be up to 24 hours. This means the RPO for this database is 24 hours.

- *An automatic failover to a backup web server has been configured for a website. Because the backup has to be powered on first and has to pull the newest version of the website from GitHub, the process takes about 8 minutes. What is the RTO of the website?*

The time it takes for the backup web server to be powered on and pull the newest version of the website from GitHub after a failure is 8 minutes. So the RTO of the website is 8 minutes. This is the time it takes for the website to be up and running again after a failure.

