#!/usr/bin/env elixir

# Converts numbered/bullet Further Reading list items with external URLs into
# inline BibTeX-style citations and appends stubs to references.bib.
#
# Input:   1. [Some Title](https://example.com) — description
# Output:  [@someTitle2026]: "Some Title." description. <https://example.com>
#
# Internal ADR links (YYYYMMDD-*.md) are left as-is.
# Already-converted [@key]: lines are skipped.
# New BibTeX stubs are appended to references.bib (deduplicated by key).
#
# Usage:
#   elixir convert_further_reading.exs decisions/
#   elixir convert_further_reading.exs --dry-run decisions/

defmodule ConvertFurtherReading do
  @bib_path Path.join(__DIR__, "references.bib")

  # Matches a numbered or bullet list item with a markdown link + external URL
  @item ~r/^(\s*(?:\d+\.|-)\s+)\[([^\]]+)\]\((https?:\/\/[^)]+)\)(.*)/

  # Skip internal ADR cross-references
  @adr_link ~r/\d{8}-[a-zA-Z0-9_-]+\.md/

  # Already converted
  @already_bib ~r/^\[@[a-zA-Z0-9_]+\]:/

  def key_for(title, url) do
    # Build a short slug from the title (first 3 meaningful words)
    words =
      title
      |> String.downcase()
      |> String.replace(~r/[^a-z0-9\s]/, "")
      |> String.split()
      |> Enum.reject(&(&1 in ~w(a an the of in on for and or but with to)))
      |> Enum.take(3)
      |> Enum.join("_")

    # Append year from URL or default
    year =
      case Regex.run(~r/20\d\d/, url) do
        [y | _] -> y
        nil     -> "2024"
      end

    "#{words}_#{year}"
    |> String.replace(~r/[^a-z0-9_]/, "")
  end

  def bib_stub(key, title, url, desc) do
    note = if desc != "", do: String.trim(desc), else: "Accessed 2026-04-25"
    """
    @misc{#{key},
      title  = {#{title}},
      year   = {2024},
      url    = {#{url}},
      note   = {#{note}}
    }
    """
  end

  def convert_line(line, new_keys) do
    cond do
      String.match?(line, @already_bib) ->
        {line, new_keys}

      String.match?(line, @item) ->
        [_, _prefix, title, url, rest] = Regex.run(@item, line)

        if String.match?(url, @adr_link) do
          {line, new_keys}
        else
          desc = rest |> String.replace(~r/^\s*[—–-]\s*/, "") |> String.trim()
          key  = key_for(title, url)
          cite = "[@#{key}]: \"#{title}.\" #{desc} <#{url}>"
          {cite, Map.put(new_keys, key, {title, url, desc})}
        end

      true ->
        {line, new_keys}
    end
  end

  def fix_file(path, dry_run, existing_keys) do
    lines = path |> File.read!() |> String.split("\n")

    {converted, new_keys} =
      Enum.map_reduce(lines, %{}, fn line, acc ->
        {new_line, updated} = convert_line(line, acc)
        {new_line, updated}
      end)

    # Only write new keys not already in references.bib
    truly_new = Map.reject(new_keys, fn {k, _} -> MapSet.member?(existing_keys, k) end)

    if map_size(truly_new) > 0 do
      IO.puts("#{path}: #{map_size(truly_new)} reference(s) converted")
      unless dry_run, do: File.write!(path, Enum.join(converted, "\n"))
    end

    truly_new
  end

  def load_existing_keys do
    content = File.read!(@bib_path)
    Regex.scan(~r/@\w+\{([^,]+),/, content)
    |> Enum.map(fn [_, k] -> String.trim(k) end)
    |> MapSet.new()
  end

  def run(targets, dry_run) do
    if dry_run, do: IO.puts("--- DRY RUN ---\n")

    existing_keys = load_existing_keys()

    paths =
      Enum.flat_map(targets, fn t ->
        cond do
          File.dir?(t)    -> t |> File.ls!() |> Enum.filter(&String.ends_with?(&1, ".md")) |> Enum.sort() |> Enum.map(&Path.join(t, &1))
          File.exists?(t) -> [t]
          true            -> IO.puts("not found: #{t}"); []
        end
      end)

    all_new =
      Enum.reduce(paths, %{}, fn path, acc ->
        new = fix_file(path, dry_run, MapSet.union(existing_keys, MapSet.new(Map.keys(acc))))
        Map.merge(acc, new)
      end)

    if map_size(all_new) > 0 do
      stubs = Enum.map_join(all_new, "\n", fn {key, {title, url, desc}} ->
        bib_stub(key, title, url, desc)
      end)
      IO.puts("\nAppending #{map_size(all_new)} new entries to references.bib")
      unless dry_run, do: File.write!(@bib_path, File.read!(@bib_path) <> "\n" <> stubs)
    end

    IO.puts("Done. #{map_size(all_new)} new BibTeX entries.")
  end
end

{dry_run, targets} =
  case System.argv() do
    ["--dry-run" | rest] -> {true, rest}
    args                 -> {false, args}
  end

targets = if targets == [], do: [Path.join(__DIR__, "decisions")], else: targets
ConvertFurtherReading.run(targets, dry_run)
