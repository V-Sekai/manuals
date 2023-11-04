# Proposed: Generating Random Text Data for testing V-Sekai systems

## Metadata

- Status: proposed
- Deciders: V-Sekai, Bioblaze Payne, fire
- Tags: V-Sekai, GPT-4

## Context and Problem Statement

V-Sekai is a project that aims to provide an immersive virtual world experience for users. As the project grows in complexity, it becomes increasingly important to ensure that the system is thoroughly tested and can handle various scenarios. One of the challenges faced by the V-Sekai team is the lack of diverse and realistic data for testing purposes. This limitation hinders the ability to identify potential issues and optimize the system's performance.

## Proposed Solution

To address the limitations in testing the V-Sekai system due to the lack of diverse and realistic data, this proposal suggests generating random text data for testing purposes.

### Implementation

We will use a tool like [Chance.js library](https://chancejs.com/) to generate random text data for testing purposes and use the database.

#### Text Processing

For generating random sentences, we will use something like the following method:

```javascript
chance.sentence();
```

Reference: [Chance.js Sentence](https://chancejs.com/text/sentence.html)

#### User Data

For generating random user names, we will use something like the following method:

```javascript
chance.name();
```

Reference: [Chance.js Name](https://chancejs.com/person/name.html)

#### Database Operations

We will perform the following SQL operations on the `user` and `chat` tables:

1. SELECT All Data in Table
2. SELECT LIKE Data based on %NA%
3. SELECT Specific Row Data
4. INSERT
5. UPDATE
6. DELETE

##### Tables

**Table user**

| id | username | password | updated_on | created_on |

**Table chat**

| id | user_id | name | text | updated_on | deleted_on | created_on |

#### SQL Function

We will create a SQL function to check if the username/password match and return 'OK'. We will also check if the query returned is 'OK' and add false information randomly in the nodes to signify a user doing invalid calls for production testing.

The implementation will generate 90 days of data, generating 100,000 text data entries for testing purposes.

## Positive Consequences

- Improved testing capabilities with diverse and realistic data
- Enhanced system reliability due to thorough testing
- Identification of potential issues before they impact users

## Negative Consequences

- Additional development time required to implement the solution
- Potential increase in storage requirements for generated data

## Option Graveyard

1. **Using static test data**: This option was considered for simplicity, but it would not provide the diverse and realistic data needed for thorough testing.

2. **Manual data generation**: This option involved manually creating test data, but it was deemed time-consuming and inefficient compared to using a library like Chance.js.

3. **Third-party data generation services**: While there are external services that can generate random text data, using them would introduce dependencies and potential costs. Implementing our a solution similar to Chance.js allows for better control over the process.

4. **Crowdsourcing test data**: This option involved gathering test data from users or volunteers. However, it raised concerns about data privacy, consistency, and quality.

## If this enhancement will be used infrequently, can it be worked around with a few lines of script?

No, this enhancement is essential for thorough testing and cannot be easily worked around with a few lines of script.

## Is there a reason why this should be core and done by us?

Yes, addressing the V-Sekai limitation is crucial for ensuring the system's reliability and performance. Implementing this solution internally allows for better control over the testing process and data generation.

## References

- [V-Sekai](https://v-sekai.org/)
