# Accepted: How to start a development environment for cockroach and elixir?

### Describe the status of the issue.

- [x] proposed
- [ ] draft
- [ ] rejected
- [x] accepted
- [ ] deprecated
- [ ] superseded by

### List the deciders of the issue.

V-Sekai,lyuma,fire,

### Describe the tags of the issue.

V-Sekai,

### Context and Problem Statement

How do we start our uro backend?

See also [20230107-elixir-uro-dev-sqlite](20230107-elixir-uro-dev-sqlite.md).

### Describe the proposed option and how it helps to overcome the problem or limitation

Write documentation how to update elixir.

### Describe how your proposal will work, with code, pseudo-code, mock-ups, or diagrams

Download the cockroach distribution and run this:

```bash
./cockroach.exe start-single-node  --insecure --store=node1 --listen-addr=localhost:26257 --http-addr=localhost:8080
```

You can add `--background` to run in the background.

Next, compile uro. You will need Elixir installed.

I recommend getting the latest, but for these steps, I am using Elixir v1.13.3.

Download Uro from https://github.com/V-Sekai/uro

We are using the dev environment. It is the default, but you can also set `MIX_ENV=dev`.

To compile HTML/CSS webpack:

```
cd assets
npm install
npm run deploy
cd ..
```

If the compile gives issues, you can run it multiple times. To compile dependencies:

```bash
mix do compile, phx.digest
```

If one of them gives an error due to `nmake` or not having a compiler, you can fix it by opening a `x64 Native Tools command prompt` from visual studio and run
`mix deps.compile bcrypt_elixir`

Finally, create and migrate the database and start the development server:

```bash
mix ecto.create
mix ecto.migrate
mix phx.server
```

This will start uro at http://localhost:4000/

[GitHub - V-Sekai/uro: Server backend for V-Sekai written in Elixir ...](https://github.com/V-Sekai/uro)

The docker image docker-uro is compiled using GoCD, so after pushing, check that the pipeline ran.

Then, go to DockerHub at https://hub.docker.com/r/groupsinfra/uro/tags and check the most recently pushed tag (it will not be the latest one, but instead a specific version).

Now, edit the flux config at https://github.com/V-Sekai/flux-config/blob/flux2/workloads/uro-deployment.yaml and replace the uro image version with the tag from above.

Check that uro-deployment was updated.

### Positive Consequences

We're able to update uro!

### Negative Consequences

_No response_

### Option graveyard

_No response_

### If this enhancement will not be used often, can it be worked around with a few lines of script?

It's arguably a few lines of script, but it's our script!

### Is there a reason why this should be core and done by us?

We maintain the website.

### References

- [V-Sekai](https://v-sekai.org/)
- [Uro](https://github.com/V-Sekai/uro)
- https://github.com/V-Sekai/uro/issues/52

### License of the contribution

Copyright (c) 2022 V-Sekai contributors.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
