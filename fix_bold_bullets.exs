#!/usr/bin/env elixir

# Fixes bold-first bullets by stripping the bold label and keeping the content.
#
# Only matches labels followed by : or . — bold NOUNS without punctuation
# (e.g. "- **Hips** (1 tracker)") are left untouched because the bold text
# is the content, not a hollow category label.
#
# Before: - **Stability:** Wired connections are more stable than wireless ones.
# After:  - Wired connections are more stable than wireless ones.
#
# Lines where nothing follows the label are left unchanged and reported.
#
# Usage:
#   elixir fix_bold_bullets.exs decisions/        # fix all .md files
#   elixir fix_bold_bullets.exs decisions/foo.md  # fix one file
#   elixir fix_bold_bullets.exs --dry-run decisions/
#
# Exit code: 0 always (use audit_tropes.exs to verify after).

defmodule FixBoldBullets do
  # Requires colon or period after the bold label — bold nouns without
  # trailing punctuation are skipped.
  @match   ~r/^(\s*[-*]\s+)\*\*[^*\n]+\*\*[:.]\s+(.+)/
  @empty   ~r/^(\s*[-*]\s+)\*\*[^*\n]+\*\*[:.]\s*$/
  @exclude ~r/^\s*[-*]\s+\*\*\(?[A-Z0-9]\)?\*\*/

  def fix_line(line) do
    cond do
      String.match?(line, @exclude) ->
        {:ok, line}

      String.match?(line, @match) ->
        fixed = Regex.replace(@match, line, "\\1\\2")
        {:fixed, fixed}

      String.match?(line, @empty) ->
        {:empty, line}

      true ->
        {:ok, line}
    end
  end

  def fix_file(path, dry_run) do
    lines = path |> File.read!() |> String.split("\n")

    {fixed_lines, stats} =
      Enum.map_reduce(lines, %{fixed: 0, empty: 0}, fn line, acc ->
        case fix_line(line) do
          {:ok,    l} -> {l, acc}
          {:fixed, l} -> {l, %{acc | fixed: acc.fixed + 1}}
          {:empty, l} ->
            IO.puts("  label-only (manual fix needed): #{String.trim(l)}")
            {l, %{acc | empty: acc.empty + 1}}
        end
      end)

    if stats.fixed > 0 or stats.empty > 0 do
      IO.puts("#{path}: fixed=#{stats.fixed} label-only=#{stats.empty}")
      unless dry_run do
        File.write!(path, Enum.join(fixed_lines, "\n"))
      end
    end

    stats
  end

  def run(targets, dry_run) do
    if dry_run, do: IO.puts("--- DRY RUN (no files written) ---\n")

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

    totals = Enum.reduce(paths, %{fixed: 0, empty: 0}, fn path, acc ->
      stats = fix_file(path, dry_run)
      %{fixed: acc.fixed + stats.fixed, empty: acc.empty + stats.empty}
    end)

    IO.puts("\nTotal: fixed=#{totals.fixed} label-only=#{totals.empty}")
  end
end

{dry_run, targets} =
  case System.argv() do
    ["--dry-run" | rest] -> {true,  rest}
    args                 -> {false, args}
  end

targets = if targets == [], do: [Path.join(__DIR__, "decisions")], else: targets
FixBoldBullets.run(targets, dry_run)
