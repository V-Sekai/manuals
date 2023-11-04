# Rejected: File or attestation for virtual worlds using ssh signatures

- Status: rejected <!-- draft | rejected | accepted | deprecated | superseded by -->
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
ssh-keygen -Y sign -f <(ssh-add -L) -n "avatar@v-sekai.org" < avatar-sample.vrm >> avatar-sample.vrm.avatar%40V-sekai.com.sig
ssh-keygen -Y sign -f <(ssh-add -L) -n "me@v-sekai.org" < avatar-sample.vrm >> avatar-sample.vrm.me%40V-sekai.com.sig
```

Write signature to avatar-sample.vrm.sig # Can be attested by multiple people with multiple `.sig`.

```
echo -n ernest.lee@chibifire.com | cat - <(echo -n " ") | cat - <(ssh-add -L) > allowed_signers # Can have more than o
ne line.
```

The allowed_signers file associates a string that represents a person (Principle) to a Public Key.

```
ssh-keygen -Y verify -f allowed_signers -I ernest.lee@chibifire.com -n "avatar@v-sekai.org" -s avatar-sample.vrm.avatar%40V-sekai.com.sig < avatar-sample.vrm
ssh-keygen -Y verify -f allowed_signers -I ernest.lee@chibifire.com -n "me@v-sekai.org" -s  avatar-sample.vrm.me%40V-sekai.com.sig < avatar-sample.vrm
```

Referenced https://www.agwa.name/blog/post/ssh_signatures

### Create SSH Certificates to delegate roles

```bash
# ssh-add ~/.ssh/id_ed25519
# or smartcard
# TODO: How do you change authorization of the delegation?
ssh-keygen -Us <(ssh-add -L) -I fire@example.com -n avatar@V-Sekai.com -V +1h KEYFILE.pub
```

### Distributing keys

```bash
# Resulting file is namespace.allowed_signers but uri_encoded.
curl https://github.com/fire.keys > avatars%40V-Sekai.com.allowed_signers # Needs a id in email syntax in front of a key
curl files://uro > avatars%40V-sekai.com.allowed_signers # Assumed in correct format
curl http://matrix-homeserver.example.com/fire > avatars%40V-sekai.com.allowed_signers # Assumed in correct format
```

## Positive Consequences <!-- optional -->

- Able to distribute a game launcher.
- Able to add a makers mark to items.
- Use for verifying binaries
- Use for verifying game modifications
- Used for lobby servers to prove to the player that they are official.
- Double sided friending

## Negative Consequences <!-- optional -->

- No data encryption

## Option graveyard: <!-- same as above -->

- Option: Matrix
- Rejection Reason: Technically complicated to devops start and multiple layers compared to an offline approach.

- Option: Ipfs and Etherium
- Rejection Reason: Requires a globally distributed database.

- Option: Sigstore https://www.sigstore.dev/
- Rejection Reason: Why aren't we using sigstore?

## If this enhancement will not be used often, can it be worked around with a few lines of script?

Not able to use a few lines of code.

## Is there a reason why this should be core and done by us?

We have to define the trust.

## References <!-- optional -->

- https://github.com/V-Sekai/
- https://github.com/sigstore/rekor/tree/main/pkg/pki/ssh
- https://stackoverflow.com/questions/4629537/how-to-encrypt-data-in-php-using-public-private-keys
- https://stackoverflow.com/questions/60160082/how-to-achieve-openssl-smime-encrypt-with-public-key-functionality-in-code
- https://github.com/cloudtools/ssh-cert-authority
- https://github.com/je9000/ssh-smime

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
