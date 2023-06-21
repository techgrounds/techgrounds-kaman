# Symmetric encryption

Symmetric encryption, also known as secret key encryption, is a type of encryption where the same key is used for encryption and decryption. It is called symmetric because the process of encryption and decryption is essentially the same, but reversed, and both require the same secret key.

## Key-terms
- Symmetric encryption
- Caesar cipher - works by shifting the letters in the alphabet by a certain number of places. The shift number is used as the key to encrypt and decrypt messages.
- Atbash cipher - the first letter of the alphabet is substituted for the last letter, the second letter for the second last letter, and so forth.

## Opdracht
### Gebruikte bronnen
- ChatGTP
- https://www.aesencryptiononline.com/2022/03/aes-decryption-function-ontools.html

### Ervaren problemen
It failed to decrypt the encrypted message using different tool on the internet. It took me a long time to find the same tool that encrypted the message. With that, the message could be decrypted. Maybe the problem is this particular tool, which uses different arguments to encrypt.

### Resultaat

2 digital ciphers that are still being used today:
- AES (Advanced Encryption Standard)- is used in Wi-Fi networks to encrypt the data that is transmitted and received. For instance, WPA2 and WPA3. Also used in file encryption (Bitlocker for windows)
- Blowfish and Twofish - Its being used for VPN and SSH connections, data encryption (Truecrypt, Veracrypt)

Succesfully decrypted an encrypted message send by a peer. The message is encrypted using AES.
![Image](https://github.com/techgrounds/techgrounds-kaman/blob/main/00_includes/SEC-04_screen01.png)

Both sender and receiver need the same key to read the message. The challenge is how to give this password to the receiver without anyone else finding it. This problem of securely sharing the key is the main challenge with symmetric encryption.