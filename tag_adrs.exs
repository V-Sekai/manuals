#!/usr/bin/env elixir

# Adds each ADR's filename slug (basename without .md) to its Tags section.
# Idempotent: skips files that already contain their slug.
# Handles three tag formats:
#   1. Frontmatter line:  - Tags: foo, bar
#   2. Section bullet:    ## Tags\n\n- foo, bar
#   3. No tags at all:    inserts ## Tags section before ## Further Reading /
#                         ## References / ## Derivative License, or at end

defmodule TagADRs do
  def run(decisions_dir) do
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
        File.write!(path, updated)
        IO.puts("tagged: #{filename}")
        {changed + 1, skipped}
      end
    end)
  end

  defp tag(content, slug) do
    cond do
      # Format 1: frontmatter "- Tags: ..." line
      String.match?(content, ~r/^- Tags:/m) ->
        String.replace(content, ~r/^(- Tags:.+)/m, "\\1, #{slug}")

      # Format 2: "## Tags" section with a bullet line
      String.contains?(content, "## Tags") ->
        String.replace(content, ~r/(## Tags\s*\n+- )([^\n]+)/, "\\1\\2, #{slug}")

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

decisions_dir = Path.join(__DIR__, "decisions")
{changed, skipped} = TagADRs.run(decisions_dir)
IO.puts("\nDone. tagged=#{changed} skipped=#{skipped}")
