#!/usr/bin/env elixir

# Strips bold markers from bold-first bullet labels.
# Handles two variants:
#   **label:** value  — colon outside bold
#   **label:**  value — colon inside bold
# Both become:  label: value
#
# Label-only lines (no value on same line) become: label:
#
# Skips lettered enumerations: **(A)**, **(B)**, **(1)** etc.
#
# Usage:
#   elixir fix_bold_bullets.exs decisions/        # fix all .md files
#   elixir fix_bold_bullets.exs decisions/foo.md  # fix one file
#   elixir fix_bold_bullets.exs --dry-run decisions/

defmodule FixBoldBullets do
  # Label with value: captures prefix, label text (strip trailing :.), colon/period separators, value
  @with_value ~r/^(\s*[-*]\s+)\*\*([^*\n]+?)[:.]*\*\*[:.]*\s+(.+)$/
  # Label only (nothing after): captures prefix and label text
  @label_only ~r/^(\s*[-*]\s+)\*\*([^*\n]+?)[:.]*\*\*[:.]*\s*$/
  @exclude    ~r/^\s*[-*]\s+\*\*\(?[A-Z0-9]\)?\*\*/

  def fix_line(line) do
    cond do
      String.match?(line, @exclude) ->
        {:ok, line}
      String.match?(line, @with_value) ->
        {:fixed, Regex.replace(@with_value, line, "\\1\\2: \\3")}
      String.match?(line, @label_only) ->
        {:fixed, Regex.replace(@label_only, line, "\\1\\2:")}
      true ->
        {:ok, line}
    end
  end

  def fix_file(path, dry_run) do
    lines = path |> File.read!() |> String.split("\n")

    {fixed_lines, count} =
      Enum.map_reduce(lines, 0, fn line, acc ->
        case fix_line(line) do
          {:ok,    l} -> {l, acc}
          {:fixed, l} -> {l, acc + 1}
        end
      end)

    if count > 0 do
      IO.puts("#{path}: #{count} lines fixed")
      unless dry_run, do: File.write!(path, Enum.join(fixed_lines, "\n"))
    end

    count
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

    total = Enum.reduce(paths, 0, &(&2 + fix_file(&1, dry_run)))
    IO.puts("\nTotal: #{total} lines fixed")
  end
end

{dry_run, targets} =
  case System.argv() do
    ["--dry-run" | rest] -> {true,  rest}
    args                 -> {false, args}
  end

targets = if targets == [], do: [Path.join(__DIR__, "decisions")], else: targets
FixBoldBullets.run(targets, dry_run)
