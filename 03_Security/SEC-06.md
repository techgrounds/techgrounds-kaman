# Public Key Infrastructure
Public Key Infrastructure (PKI) is a system of processes, technologies, and policies that allows you to encrypt and sign data. You can issue digital certificates that authenticate the identity of users, devices, or services. These certificates create a secure connection for both public web pages and private systems

PKI is implemented by a variety of entities known as Certificate Authorities (CAs). These authorities are responsible for issuing, managing, and revoking digital certificates. 

## Key-terms
- PKI
- X.509 - a standard defining the format of public key certificates. These certificates are used in many Internet protocols, including TLS and SSL, which are the foundations of secure communications on the web.
- Certificate Authority (CA) - The CA is a critical component within the PKI. It is responsible for authenticating the identity of the certificate applicant (which could be an individual, a server, a company, etc.) before issuing the certificate.
- Registration Authority (RA): The RA is an entity that acts as the verifier for the certificate authority before a digital certificate is issued to a requestor. It's responsible for confirming the identity of entities requesting certificates.
- End Entities (EE): These are the users of the digital certificates. They could be clients, servers, or even individual users. End entities use their certificates for secure communication, encryption/decryption, and digital signing of information.

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
- https://geekrewind.com/how-to-create-self-signed-certificates-on-ubuntu-linux/
- https://www.keyfactor.com/education-center/what-is-pki/
https://www.youtube.com/watch?v=kAaIYRJoJkc
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