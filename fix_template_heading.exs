#!/usr/bin/env elixir

# Replaces the verbatim template heading prompt with "## Design".
#
# Before: ## Describe how your proposal will work with code, pseudo-code, mock-ups, or diagrams
# After:  ## Design
#
# Also handles capitalisation variants (all lower, title case, etc.).
#
# Usage:
#   elixir fix_template_heading.exs decisions/
#   elixir fix_template_heading.exs --dry-run decisions/

defmodule FixTemplateHeading do
  @pattern ~r/^(###?)\s+Describe [Hh]ow [Yy]our [Pp]roposal [Ww]ill [Ww]ork.*$/m

  def fix_file(path, dry_run) do
    content = File.read!(path)
    updated = Regex.replace(@pattern, content, fn _full, level -> "#{level} Design" end)

    if updated == content do
      0
    else
      count = length(Regex.scan(@pattern, content))
      IO.puts("#{path}: #{count} heading(s) replaced")
      unless dry_run, do: File.write!(path, updated)
      count
    end
  end

  def run(targets, dry_run) do
    if dry_run, do: IO.puts("--- DRY RUN (no files written) ---\n")

    paths =
      Enum.flat_map(targets, fn target ->
        cond do
          File.dir?(target) ->
            target |> File.ls!()
            |> Enum.filter(&String.ends_with?(&1, ".md"))
            |> Enum.sort()
            |> Enum.map(&Path.join(target, &1))
          File.exists?(target) -> [target]
          true -> IO.puts("not found: #{target}"); []
        end
      end)

    {files, lines} =
      Enum.reduce(paths, {0, 0}, fn path, {fa, la} ->
        n = fix_file(path, dry_run)
        if n > 0, do: {fa + 1, la + n}, else: {fa, la}
      end)

    IO.puts("\nTotal: #{files} files, #{lines} headings replaced")
  end
end

{dry_run, targets} =
  case System.argv() do
    ["--dry-run" | rest] -> {true,  rest}
    args                 -> {false, args}
  end

targets = if targets == [], do: [Path.join(__DIR__, "decisions")], else: targets
FixTemplateHeading.run(targets, dry_run)
