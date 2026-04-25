#!/usr/bin/env elixir

# Converts bare backtick-quoted ADR filename references into Markdown hyperlinks.
# Before: `20260421-some-adr.md`
# After:  [20260421-some-adr.md](20260421-some-adr.md)
#
# Skips references already inside a Markdown link: [text](`...`) or [`...`](...)
# Idempotent: a file with no bare references is not rewritten.
#
# Usage:
#   elixir linkify_adrs.exs            # apply changes
#   elixir linkify_adrs.exs --dry-run  # show diffs, write nothing

defmodule LinkifyADRs do
  # Matches a backtick-quoted YYYYMMDD-slug.md NOT preceded by [ (already link text)
  @pattern ~r/(?<!\[)`(\d{8}-[a-zA-Z0-9_-]+\.md)`/

  def run(decisions_dir, dry_run \\ false) do
    decisions_dir
    |> File.ls!()
    |> Enum.filter(&String.ends_with?(&1, ".md"))
    |> Enum.sort()
    |> Enum.reduce({0, 0}, fn filename, {changed, skipped} ->
      path    = Path.join(decisions_dir, filename)
      content = File.read!(path)
      updated = String.replace(content, @pattern, "[\\1](\\1)")

      if updated == content do
        {changed, skipped + 1}
      else
        if dry_run do
          IO.puts("would linkify: #{filename}")
          diff(content, updated)
        else
          File.write!(path, updated)
          IO.puts("linkified: #{filename}")
        end
        {changed + 1, skipped}
      end
    end)
  end

  defp diff(before, after_content) do
    before_lines = String.split(before, "\n")
    after_lines  = String.split(after_content, "\n")

    before_lines
    |> Enum.zip(after_lines)
    |> Enum.each(fn {a, b} ->
      if a != b do
        IO.puts("  - #{a}")
        IO.puts("  + #{b}")
      end
    end)

    extra = length(after_lines) - length(before_lines)
    if extra > 0 do
      after_lines
      |> Enum.drop(length(before_lines))
      |> Enum.each(&IO.puts("  + #{&1}"))
    end
  end
end

dry_run = "--dry-run" in System.argv()
if dry_run, do: IO.puts("--- DRY RUN (no files written) ---\n")

decisions_dir = Path.join(__DIR__, "decisions")
{changed, skipped} = LinkifyADRs.run(decisions_dir, dry_run)

label = if dry_run, do: "would_linkify", else: "linkified"
IO.puts("\nDone. #{label}=#{changed} skipped=#{skipped}")
