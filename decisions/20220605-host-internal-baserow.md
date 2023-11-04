# Proposed: Host a baserow application for internal use.

### Describe the status of the issue.

- [x] proposed
- [x] draft
- [ ] rejected
- [ ] accepted
- [ ] deprecated
- [ ] superseded by

### List the deciders of the issue.

V-Sekai,fire

### Describe the tags of the issue.

V-Sekai,

### Context and Problem Statement

I want to store adjacent information related to V-Sekai in a database.

### Describe the proposed option and how it helps to overcome the problem or limitation

Add a digital ocean apps config.

https://www.digitalocean.com/products/app-platform

Features:

1. managed postgresql database
2. no managed redis
3. digital ocean spaces
4. apps platform

```
databases:
- engine: PG
  name: baserow-db
  num_nodes: 1
  size: basic-xs
  version: "12"
name: chibifire-base
region: tor
services:
- envs:
  - key: BASEROW_PUBLIC_URL
    scope: RUN_AND_BUILD_TIME
    value: https://${APP_DOMAIN}
  - key: DATABASE_URL
    scope: RUN_AND_BUILD_TIME
    value: postgresql://${baserow-db.USERNAME}:${baserow-db.PASSWORD}@${baserow-db.HOSTNAME}:${baserow-db.PORT}/${baserow-db.DATABASE}
  - key: AWS_ACCESS_KEY_ID
    scope: RUN_AND_BUILD_TIME
    value: AWS_ACCESS_KEY_ID_AWS_ACCESS_KEY_ID
  - key: AWS_S3_ENDPOINT_URL
    scope: RUN_AND_BUILD_TIME
    value: https://sfo3.digitaloceanspaces.com
  - key: AWS_S3_CUSTOM_DOMAIN
    scope: RUN_AND_BUILD_TIME
    value: 'chibifire.sfo3.digitaloceanspaces.com '
  - key: AWS_S3_REGION_NAME
    scope: RUN_AND_BUILD_TIME
    value: sfo3
  - key: AWS_STORAGE_BUCKET_NAME
    scope: RUN_AND_BUILD_TIME
    value: chibifire
  - key: AWS_SECRET_ACCESS_KEY
    scope: RUN_AND_BUILD_TIME
    type: SECRET
    value: SECRETSECRETSECRET
    scope: RUN_AND_BUILD_TIME
    value: "true"
  - key: SYNC_TEMPLATES_ON_STARTUP
    scope: RUN_AND_BUILD_TIME
    value: "false"
  - key: PRIVATE_BACKEND_URL
    scope: RUN_AND_BUILD_TIME
    value: ${_self.PRIVATE_URL}
  http_port: 80
  image:
    registry: baserow
    registry_type: DOCKER_HUB
    repository: baserow
    tag: 1.10.2
  instance_count: 1
  instance_size_slug: basic-xs
  name: baserow-baserow
  routes:
  - path: /

```

### Positive Consequences

I can finally store things.

### Negative Consequences

Pay for the baserow service.

### Option graveyard

- Rejected using premium saas from baserow
- Rejected using airtable

### If this enhancement will not be used often, can it be worked around with a few lines of script?

Not a few lines of code, but fairly simple.

### Is there a reason why this should be core and done by us?

I need to store things.

### References

- [V-Sekai](https://v-sekai.org/)
- [Create digital ocean instructions](https://gitlab.com/bramw/baserow/-/issues/998)

### License of the contribution

Copyright (c) 2022 V-Sekai contributors.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
