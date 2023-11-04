# Accepted: Write List of Github Pull Requests for Review

## Metadata

- **Status:** Accepted
- **Deciders:** V-Sekai, fire
- **Tags:** V-Sekai, Elixir, GitHub API, Pull Requests

## Context

The objective is to fetch and compile a list of open pull requests from the Godot Engine repository on GitHub using Elixir.

## Problem

The challenge lies in utilizing the GitHub GraphQL API to retrieve data about open pull requests in a specific milestone of the Godot Engine repository. This data should then be written to a text file for subsequent review.

## Solution

Here's the proposed solution:

1. Utilize the `HTTPoison` library to send a POST request to the GitHub GraphQL API.
2. Parse the response with the `Jason` library.
3. Write the relevant data to a text file using Elixir's built-in `File` module.

## Advantages

This method allows us to fetch and store data about open pull requests in a structured and automated manner. It also facilitates offline review of this data or sharing it with others.

## Disadvantages

While the script is designed to handle pagination and fetch all open pull requests, it may still encounter issues if the number of requests exceeds the rate limit set by GitHub's API. In such cases, some data might not be fetched until the rate limit resets. Additionally, as the script fetches data in batches of 50, it could take a significant amount of time to fetch all data if there are hundreds or thousands of open pull requests.

## Alternatives

An alternative approach could have been to use the GitHub REST API instead of the GraphQL API. However, the GraphQL API allows for more flexible and efficient data fetching.

## Limitations

This script might not be suitable if you need to fetch data about closed pull requests or pull requests in other repositories or milestones.

## Ownership

Yes, this is a core part of our development process and is done by us.

## References

For more information, you can visit the following links:

- [V-Sekai](https://github.com/v-sekai/)
- [GitHub GraphQL API](https://docs.github.com/en/graphql)
- [Elixir HTTPoison Library](https://hexdocs.pm/httpoison/readme.html)
- [Elixir Jason Library](https://hexdocs.pm/jason/readme.html)
- [Allourideas Wiki Survey](https://www.allourideas.org/prioritize-bugs-open-godot-engine-prs-milestone-4-2/admin)

This article was assisted by AI.

# Reference Code Notebook

<!-- livebook:{"persist_outputs":true} -->

```elixir
Mix.install([
  {:jason, "~> 1.2"},
  {:csv, "~> 2.4"},
  {:httpoison, "~> 2.1"}
])
```

## Section

```elixir
defmodule PullRequestFetcher do
  @query """
  {
    repository(owner: "godotengine", name: "godot") {
      milestone(number: 18) {
        title
        pullRequests(states: OPEN, first: 50) {
          pageInfo {
            endCursor
            hasNextPage
          }
          nodes {
            number
            title
            labels(first: 10) {
              nodes {
                name
              }
            }
          }
        }
      }
    }
  }
  """

  def fetch_and_write_pull_requests(query \\ @query, file \\ nil) do
    file = if file, do: file, else: File.open!("pull_requests.txt", [:write, :utf8])

    {:ok, response} =
      HTTPoison.post(
        "https://api.github.com/graphql",
        Jason.encode!(%{query: query}),
        [
          {"Authorization", "Bearer #{System.fetch_env!("LB_GITHUB_TOKEN")}"},
          {"Content-Type", "application/json"}
        ],
        timeout: 500_000,
        reciv_timeout: 500_000
      )

    data = Jason.decode!(response.body)
    pull_requests = data["data"]["repository"]["milestone"]["pullRequests"]

    for pull_request <- pull_requests["nodes"] do
      labels = pull_request["labels"]["nodes"] |> Enum.map(& &1["name"]) |> Enum.join(", ")
      row = "#{pull_request["title"]} (##{pull_request["number"]}) - Labels: [#{labels}]"
      IO.write(file, row <> "\n")
    end

    if pull_requests["pageInfo"]["hasNextPage"] do
      next_query = """
      {
        repository(owner: "godotengine", name: "godot") {
          milestone(number: 18) {
            title
            pullRequests(states: OPEN, first: 50, after: "#{pull_requests["pageInfo"]["endCursor"]}") {
              pageInfo {
                endCursor
                hasNextPage
              }
              nodes {
                number
                title
                labels(first: 10) {
                  nodes {
                    name
                  }
                }
              }
            }
          }
        }
      }
      """

      fetch_and_write_pull_requests(next_query, file)
    else
      :ok = File.close(file)
    end
  end
end

PullRequestFetcher.fetch_and_write_pull_requests()
```

<!-- livebook:{"output":true} -->

```
:ok
```

<!-- livebook:{"offset":2421,"stamp":{"token":"XCP.D8ekCw4i8O5H1Ia3GtS9sQIJ336xzpQIAfqskwhhWt_2LRllPx_INw7FtdhD84mB913O9RVrBuP2O194VuLjdtNmexowzH3wRLDG-j4zGkY_Ngh3VDD1","version":2}} -->
