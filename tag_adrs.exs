#!/usr/bin/env elixir

# Adds each ADR's filename slug (basename without .md) to its Tags section.
# Idempotent: skips files that already contain their slug.
# Handles three tag formats:
#   1. Frontmatter line:  - Tags: foo, bar
#   2. Section bullet:    ## Tags\n\n- foo, bar
#   3. No tags at all:    inserts ## Tags section before ## Further Reading /
#                         ## References / ## Derivative License, or at end

defmodule TagADRs do
  def run(decisions_dir, dry_run \\ false) do
    decisions_dir
    |> File.ls!()
    |> Enum.filter(&String.ends_with?(&1, ".md"))
    |> Enum.sort()
    |> Enum.reduce({0, 0}, fn filename, {changed, skipped} ->
      slug = Path.rootname(filename)
      path = Path.join(decisions_dir, filename)
      content = File.read!(path)

      if String.contains?(content, slug) do
        {changed, skipped + 1}
      else
        updated = tag(content, slug)
        if dry_run do
          IO.puts("would tag: #{filename}")
          diff(content, updated)
        else
          File.write!(path, updated)
          IO.puts("tagged: #{filename}")
        end
        {changed + 1, skipped}
      end
    end)
  end

  defp diff(before, after_content) do
    before_lines = String.split(before, "\n")
    after_lines  = String.split(after_content, "\n")
    Enum.zip_with(before_lines, after_lines, fn a, b ->
      if a != b do
        IO.puts("  - #{a}")
        IO.puts("  + #{b}")
      end
    end)
    # Print any extra lines added at the end
    extra = length(after_lines) - length(before_lines)
    if extra > 0 do
      after_lines
      |> Enum.drop(length(before_lines))
      |> Enum.each(&IO.puts("  + #{&1}"))
    end
  end

  defp tag(content, slug) do
    cond do
      # Format 1: frontmatter "- Tags: ..." line
      String.match?(content, ~r/^- Tags:/m) ->
        String.replace(content, ~r/^(- Tags:.+)/m, "\\1, #{slug}")

      # Format 2a: "## Tags" section with a "- " bullet line
      String.match?(content, ~r/## Tags\s*\n+- /s) ->
        String.replace(content, ~r/(## Tags\s*\n+- )([^\n]+)/, "\\1\\2, #{slug}")

      # Format 2b: "## Tags" section with content but no "- " bullet — normalise
      String.contains?(content, "## Tags") ->
        String.replace(
          content,
          ~r/(## Tags\s*\n+)([^#\n][^\n]*)/s,
          "\\1- \\2, #{slug}"
        )

      # Format 3: no tags — insert before first known anchor, or at end
      true ->
        tag_block = "## Tags\n\n- #{slug}\n\n"
        anchors = ["## Further Reading", "## References", "## Derivative License"]
        case Enum.find(anchors, &String.contains?(content, &1)) do
          nil  -> String.trim_trailing(content) <> "\n\n## Tags\n\n- #{slug}\n"
          anch -> String.replace(content, anch, tag_block <> anch, global: false)
        end
    end
  end
end

dry_run = "--dry-run" in System.argv()
if dry_run, do: IO.puts("--- DRY RUN (no files written) ---\n")

decisions_dir = Path.join(__DIR__, "decisions")
{changed, skipped} = TagADRs.run(decisions_dir, dry_run)
IO.puts("\nDone. would_tag=#{changed} skipped=#{skipped}")
