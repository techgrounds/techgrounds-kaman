# Asymmetric encryption

Asymmetric encryption, also known as public key cryptography, is a type of encryption where keys come in pairs. What one key encrypts, only the other can decrypt. This allows you to share one key (the public key) openly for anyone to encrypt messages with, while keeping the other key (the private key) secret for you alone to decrypt those messages. This way, information can be securely transmitted even if the communication channel is not secure.



## Key-terms
- Asymmetric - refers to the use of two different keys for the encryption and decryption processes.
- Public key - This is the key that can be freely distributed and shared with anyone. It's used for encrypting data or verifying digital signatures.
- Private key -This is the key that is kept secret and never shared. It's used for decrypting data or creating digital signatures.
- Widely used Asymmetrical encryption algorithms:
    - RSA (Rivest-Shamir-Adleman)
    - Elliptic Curve Cryptography (ECC)
    - Diffie-Hellman (DH) and Elliptic Curve - Diffie-Hellman (ECDH)
    - Digital Signature Algorithm (DSA) and its Elliptic Curve version (ECDSA)


## Opdracht
### Gebruikte bronnen
ChatGPT
https://cheapsslsecurity.com/blog/what-is-asymmetric-encryption-understand-with-simple-examples/
https://www.devglan.com/online-tools/rsa-encryption-decryption

### Ervaren problemen
Kon geen public key opgegeven in de tool die bij de opdracht staat. Door gebruik te maken een andere tool kon ik berichten encrypten met de public key van een peer.

### Resultaat
![Image](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/SEC-05_screen01.png)

Decrypted the message using the private key.
![Image](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/SEC-05_screen02.png)