# File or attestation for virtual worlds using ssh signatures

- Status: proposed <!-- draft | rejected | accepted | deprecated | superseded by -->
- Deciders: V-Sekai,
- Tags: V-Sekai,

## Context and Problem Statement

File or attestation for virtual worlds

## Describe the proposed option and how it helps to overcome the problem or limitation

Use ssh signatures. 

## Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

An analogy of a CD and a CD case with stickers.

### File attestation

Read your public key.

```
$ ssh-add -L > me.pub # Can be related to a X.509 `.crt`
```

Create a file.
```
$ touch avatar-sample.vrm
```

Sign your file.

```
$ ssh-keygen -Y sign -f me.pub -n "avatar@v-sekai.org" avatar-sample.vrm
```

Write signature to avatar-sample.vrm.sig # Can be attested by multiple people with multiple `.sig`

```
$ echo -n ernest.lee@chibifire.com (String | cat - <(echo -n " ") | cat - <(ssh-add -L) > allowed_signers # Can have more than one line. T
```

The allowed_signers file associates a string that represents a person (Principle) to a Public Key.

```
$ ssh-keygen -Y verify -f allowed_signers -I ernest.lee@chibifire.com -n "avatar@v-sekai.org" -s avatar-sample.vrm.sig < avatar-sample.vrm
Good "avatar@v-sekai.org" signature for ernest.lee@chibifire.com with RSA key SHA256:W7APE+9tyFUdGzzcYCwcdknWm0vb1KPso8XogFP2u+k
```
Referenced https://www.agwa.name/blog/post/ssh_signatures


### List of uses for ssh signatures

SSH signatures can be used for:

1. Use for verifying binaries
2. Use for verifying game modifications
3. Used for lobby servers to prove to the player that they are official.
4. Double sided friending

### How to use a x509 certificate for ssh login

```bash
# Extract the private key from the P12:
openssl pkcs12 -in my_cert.p12 -out my_cert.pem -nodes
openssl pkcs12 -in my_cert.p12 -out my_sshkeys.pem -nodes -nocerts
# Finally extract the public key from the certificate PEM file and append it to the private key:
openssl x509 -in my_cert.pem -pubkey -noout >> my_sshkeys.pem
# my_cert.pem can now be removed. It is not required anymore.
# You can use ssh-keygen to create the line to put into your remote `~/.ssh/authorized_keys` file:
ssh-keygen -i -m PKCS8 -f my_sshkeys.pem
eval "$(ssh-agent -s)"
ssh-add my_sshkeys.pem
# https://trueg.wordpress.com/2012/09/06/use-an-x-509-certificate-for-ssh-login/
# TODO: fire 2021-11-13 use mbedtls only
```

### Encrypt files

A common recommendation is not to combine encryption with authentication.

Use your SSH signature to sign a enveloped list of X.509 certificates and use SMIME.

### Create SSH Certificates

ssh-keygen -f CA
ssh-keygen -s CA -I fire@example.com -n avatar@V-Sekai.com -V +1h KEYFILE.pub

ssh-keygen -Us <(ssh-add -L) -I fire@example.com -n avatar@V-Sekai.com -V +1h KEYFILE.pub

### Distributing keys

```bash
# Resulting file is namespace.allowed_signers but uri_encoded.
curl https://github.com/fire.keys > avatars%40V-Sekai.com.allowed_signers # Needs a id in email syntax in front of a key 
curl files://uro > avatars%40V-sekai.com.allowed_signers # Assumed in correct format
curl http://matrix-homeserver.example.com/fire > avatars%40V-sekai.com.allowed_signers # Assumed in correct format
```

### Envelope

```bash
# Uncompressed zip

Avoid compression explosions.

1. zip AvatarSample_A.vrm.sig
2. zip AvatarSample_A.vrm 

# Email multipart

1. Use email multipart
```

## Positive Consequences <!-- optional -->

- Able to distribute a game launcher.
- Able to add a makers mark to items.

## Negative Consequences <!-- optional -->

- [e.g., compromising quality attribute, follow-up decisions required, …]

[this section can be repeated for each option if more than one option is open for consideration]

## Option graveyard: <!-- same as above -->

- Option: Matrix 
- Rejection Reason: Technically complicated to devops start and multiple layers compared to an offline approach.

- Option: Ipfs and Etherium 
- Rejection Reason: Requires a globally distributed database.

## If this enhancement will not be used often, can it be worked around with a few lines of script?

Not able to use a few lines of code.

## Is there a reason why this should be core and done by us?

We have to define the trust.

## References <!-- optional -->

- https://github.com/V-Sekai/
- https://github.com/sigstore/rekor/tree/main/pkg/pki/ssh
- https://stackoverflow.com/questions/4629537/how-to-encrypt-data-in-php-using-public-private-keys
- https://stackoverflow.com/questions/60160082/how-to-achieve-openssl-smime-encrypt-with-public-key-functionality-in-code

## Derivative License

Copyright (c) 2020-2021 V-Sekai contributors.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
