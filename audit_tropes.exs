#!/usr/bin/env elixir

# Scans one ADR file or every .md file in a directory for bold-first bullets.
# Pattern: a list item whose first content is a bold label, e.g.
#   - **Stability:** Wired connections are generally more stable...
#
# Usage:
#   elixir audit_tropes.exs decisions/20240709-wired-first.md
#   elixir audit_tropes.exs decisions/
#   elixir audit_tropes.exs              # defaults to ./decisions/
#
# Exit code: 0 if clean, 1 if any findings.

defmodule TropeAudit do
  # Matches bold-first bullets with a trailing colon or period — the AI trope.
  # Bold nouns without punctuation (e.g. "- **Hips** (1 tracker)") are NOT
  # matched because the bold text is the content, not a hollow category label.
  @pattern ~r/^\s*[-*]\s+\*\*[^*\n]+\*\*[:.]\s/

  # Excluded: lettered enumerations **(A)**, **(B)** etc. and single-digit
  # numbered labels **(1)** — these are structural enumeration, not AI prose.
  @exclude ~r/^\s*[-*]\s+\*\*\(?[A-Z0-9]\)?\*\*/

  def audit_file(path) do
    hits =
      path
      |> File.read!()
      |> String.split("\n")
      |> Enum.with_index(1)
      |> Enum.filter(fn {line, _n} ->
        String.match?(line, @pattern) and not String.match?(line, @exclude)
      end)

    {path, hits}
  end

  def report({path, []}), do: IO.puts("#{path}: clean")

  def report({path, hits}) do
    IO.puts("\n#{path}")
    Enum.each(hits, fn {line, n} ->
      IO.puts("  line #{n}: #{String.trim(line)}")
    end)
  end

  def run(targets) do
    paths =
      Enum.flat_map(targets, fn target ->
        cond do
          File.dir?(target) ->
            target
            |> File.ls!()
            |> Enum.filter(&String.ends_with?(&1, ".md"))
            |> Enum.sort()
            |> Enum.map(&Path.join(target, &1))
          File.exists?(target) -> [target]
          true ->
            IO.puts("not found: #{target}")
            []
        end
      end)

    results = Enum.map(paths, &audit_file/1)
    Enum.each(results, &report/1)

    dirty = Enum.count(results, fn {_, hits} -> hits != [] end)
    total = length(results)
    IO.puts("\n#{dirty} of #{total} files have bold-first bullets.")
    if dirty > 0, do: System.halt(1)
  end
end

targets =
  case System.argv() do
    []   -> [Path.join(__DIR__, "decisions")]
    args -> args
  end

TropeAudit.run(targets)
