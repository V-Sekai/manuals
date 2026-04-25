#!/usr/bin/env elixir
defmodule Report do
  @pattern ~r/^\s*[-*]\s+\*\*[^*\n]+\*\*[:\.]?\s/
  @exclude ~r/^\s*[-*]\s+\*\*\(?[A-Z0-9]\)?\*\*/

  def run do
    dir   = Path.join(__DIR__, "decisions")
    files = dir |> File.ls!() |> Enum.filter(&String.ends_with?(&1, ".md")) |> Enum.sort()

    header = [
      "# Bold-First Bullet Audit Report\n\n",
      "Generated: #{Date.utc_today()}\n\n",
      "Mark `[x]` on genuine AI hollow labels to strip. ",
      "Leave `[ ]` on proper nouns, glossary terms, and config fields.\n\n---\n\n"
    ]

    body = Enum.flat_map(files, fn filename ->
      path    = Path.join(dir, filename)
      content = File.read!(path)
      hits    = content
        |> String.split("\n")
        |> Enum.with_index(1)
        |> Enum.filter(fn {line, _} ->
          String.match?(line, @pattern) and not String.match?(line, @exclude)
        end)
      if hits == [] do
        []
      else
        header_line = "## #{filename}\n\n"
        items = Enum.map(hits, fn {line, n} ->
          "- [ ] line #{n}: `#{String.trim(line)}`\n"
        end)
        [header_line] ++ items ++ ["\n"]
      end
    end)

    n_files = Enum.count(body, &String.starts_with?(&1, "## "))
    n_lines = Enum.count(body, &String.starts_with?(&1, "- [ ]"))
    footer  = ["---\n\n#{n_files} files, #{n_lines} candidate lines.\n"]

    out = Path.join(__DIR__, "bold_bullet_report.md")
    File.write!(out, Enum.join(header ++ body ++ footer))
    IO.puts("Written: bold_bullet_report.md  (#{n_files} files, #{n_lines} lines)")
  end
end
Report.run()
