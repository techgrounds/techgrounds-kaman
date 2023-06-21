# Public Key Infrastructure
This is a system that establishes trust and secure communication between entities over a public network such as the internet. PKI is used to manage the creation, distribution, identification, and revocation of public key certificates. It allows entities (like users or servers) to prove their identity to others, and securely exchange information with them. It's the foundation of services like SSL/TLS, which secures web traffic, and other forms of secure communication.
## Key-terms
- PKI
- X.509
- Certificate Authority (CA)

- Certificate paths

Certificate paths looks something like this:
```
Root CA
| 
--> Intermediate CA 1
    |
    --> Intermediate CA 2
        |
        --> End-User Certificate (yourdomain.com)
```
It follows a hierarchical structure that starts with the root certificate and ends with the end-user's certificate. Each certificate in the path is signed by the one above it in the hierarchy.


## Opdracht
### Gebruikte bronnen
https://geekrewind.com/how-to-create-self-signed-certificates-on-ubuntu-linux/

### Ervaren problemen
[Geef een korte beschrijving van de problemen waar je tegenaan bent gelopen met je gevonden oplossing.]

### Resultaat
With openssl i created created a certificate and key using the arguments below:


- **-newkey rsa:4096** – creates a new certificate request and 4096 bit RSA key.
- **-x509** – creates a X.509 certificate.
- **-sha256** – use 265-bit SHA (Secure Hash Algorithm) to create the certificate
- **-days 365** – the number of days to certify the certificate for. Typically a year or more
- **-nodes** – creates a key without a passphrase.
- **-out sec06.crt** – specifies the filename to write the newly created certificate to
- **-keyout sec06.key** – specifies the filename to write the private key to.

![Image](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/SEC-06_screen01.png)

Checked the status of the certificate with:
`openssl x509 -in mycert.pem -text -noout
`

![Image](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/SEC-06_screen02.png)



You can find all certificate on your pc in windows using certmgr `certmgr.msc`

![Image](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/SEC-06_screen03.png)

The default location for certificates is Ubuntu is:
`/etc/ssl/certs/`