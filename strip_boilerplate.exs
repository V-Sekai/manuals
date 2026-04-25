#!/usr/bin/env elixir

# Removes AI-generated boilerplate lines from ## Further Reading sections:
#   - V-Sekai / v-sekai GitHub self-links
#   - v-sekai-game GitHub self-links
#   - v-sekai.org self-links
#   - "AI assistant Aria assisted with this article." footer
#
# Leaves blank lines collapsed so sections stay readable.
#
# Usage:
#   elixir strip_boilerplate.exs decisions/
#   elixir strip_boilerplate.exs --dry-run decisions/

defmodule StripBoilerplate do
  # Only match bare homepage / self-promotion links — NOT file attachments,
  # specific branches, or named repos other than v-sekai-game.
  @boilerplate [
    # github.com/v-sekai  or  github.com/v-sekai/  (org homepage, no subpath)
    ~r/https:\/\/github\.com\/[Vv]-[Ss]ekai\/?(?:\s|$|\))/,
    # github.com/v-sekai/v-sekai-game  (exact game repo homepage)
    ~r/https:\/\/github\.com\/[Vv]-[Ss]ekai\/v-sekai-game\/?(?:\s|$|\))/,
    # v-sekai.org homepage (bare or trailing slash only)
    ~r/https:\/\/v-sekai\.org\/?(?:\s|$|\))/,
  ]

  @aria_line ~r/^>?\s*_?(?:AI(?: assistant)? )?Aria assisted\b.*$/

  def boilerplate?(line) do
    is_aria = String.match?(line, @aria_line)
    is_list = String.match?(line, ~r/^\s*(\d+\.|[-*])\s+\[.*\]\(/)
    is_vsekai = Enum.any?(@boilerplate, &String.match?(line, &1))
    is_aria or (is_list and is_vsekai)
  end

  def fix_file(path, dry_run) do
    lines   = path |> File.read!() |> String.split("\n")
    filtered = Enum.reject(lines, &boilerplate?/1)

    collapsed = filtered

    removed = length(lines) - length(filtered)

    if removed > 0 do
      IO.puts("#{path}: removed #{removed} line(s)")
      unless dry_run, do: File.write!(path, Enum.join(collapsed, "\n"))
    end

    removed
  end

  def run(targets, dry_run) do
    if dry_run, do: IO.puts("--- DRY RUN ---\n")

    paths =
      Enum.flat_map(targets, fn t ->
        cond do
          File.dir?(t)     -> t |> File.ls!() |> Enum.filter(&String.ends_with?(&1, ".md")) |> Enum.sort() |> Enum.map(&Path.join(t, &1))
          File.exists?(t)  -> [t]
          true             -> IO.puts("not found: #{t}"); []
        end
      end)

    total = Enum.reduce(paths, 0, &(&2 + fix_file(&1, dry_run)))
    IO.puts("\nTotal: #{total} lines removed")
  end
end

{dry_run, targets} =
  case System.argv() do
    ["--dry-run" | rest] -> {true, rest}
    args                 -> {false, args}
  end

targets = if targets == [], do: [Path.join(__DIR__, "decisions")], else: targets
StripBoilerplate.run(targets, dry_run)
