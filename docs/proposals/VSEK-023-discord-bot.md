# VSEK-023 Discord Integration

**Describe the project you are working on:**
Uro (Groups backend) and CI/CD

**Describe the problem or limitation you are having in your project:**
We would like a way to notify community members and users about activity and updates.

**Describe how this feature / enhancement will help you overcome this problem or limitation:**
A discord bot would be able to inform users via Discord about updates and changes.

**Show a mock up screenshots/video or a flow diagram explaining how your proposal will work:**

**Describe implementation detail for your proposal (in code), if possible:**
We would connect to Discord API from Elixir using one of several integration libraries.
We can report information such as server player count by editing a message; or by updating the bot status.
I would also like to poll information such as CI/CD builds and deployments. We could make an API where someone or something can post a message to be displayed in discord using curl or some command, though we would have to make sure this is locked behind a secret key. Unclear.

**If this enhancement will not be used often, can it be worked around with a few lines of script?:**
Yes, it is possible to script querying the itch.io or uro shards API. The goal of this proposal is to make this information more accessible to whose who would not script it.

**Is there a reason why this should be core and not an add-on in the asset library?:**

## Derivative License

Copyright (c) 2014-2019 Godot Engine contributors.

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
