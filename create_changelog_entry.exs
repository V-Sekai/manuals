#!/usr/bin/env elixir

# Creates a new changelog file from the most recent one, or a new template.
# Usage: elixir create_changelog_entry.exs [new_filename_stem]
# If new_filename_stem is not provided, it defaults to today's date (YYYYMMDD).
# The new_filename_stem should be in YYYYMMDD format if provided.
# Example: elixir create_changelog_entry.exs 20250426
# Example: elixir create_changelog_entry.exs (uses today's date, e.g., 20250527, as the stem)
# This will create changelog/YYYY/YYYYMMDD-deck-log.md (e.g., changelog/2025/20250527-deck-log.md)
# and replace '%%DATE%%' in it with today's date (YYYY-MM-DD).

Mix.install([
  {:timex, "~> 3.7"}
])

defmodule ChangelogCreator do
  @changelog_dir "changelog"

  def main(args \\ []) do
    actual_new_stem = get_date_stem(args)

    case validate_date_format(actual_new_stem) do
      :ok ->
        create_changelog_entry(actual_new_stem)
      {:error, reason} ->
        IO.puts("Error: #{reason}")
        System.halt(1)
    end
  end

  defp get_date_stem([]), do: Timex.format!(Timex.today(), "%Y%m%d", :strftime)
  defp get_date_stem([date_stem | _]), do: date_stem

  defp validate_date_format(date_stem) do
    case Regex.match?(~r/^\d{8}$/, date_stem) do
      true ->
        case Timex.parse(date_stem, "%Y%m%d", :strftime) do
          {:ok, _} -> :ok
          {:error, _} -> {:error, "Invalid date format. Expected YYYYMMDD."}
        end
      false ->
        {:error, "Date stem must be in YYYYMMDD format."}
    end
  end

  defp create_changelog_entry(actual_new_stem) do
    year_part = String.slice(actual_new_stem, 0, 4)
    target_subdir = Path.join(@changelog_dir, year_part)
    new_file_path = Path.join(target_subdir, "#{actual_new_stem}-deck-log.md")

    # Parse the date from the stem
    {:ok, date} = Timex.parse(actual_new_stem, "%Y%m%d", :strftime)
    file_stem_date_formatted = Timex.format!(date, "%Y-%m-%d", :strftime)
    file_stem_day_of_week = Timex.format!(date, "%A", :strftime)

    # Ensure changelog year directory exists
    File.mkdir_p!(target_subdir)

    if File.exists?(new_file_path) do
      IO.puts("File #{new_file_path} already exists. Updating its timestamp.")
      File.touch!(new_file_path)
    else
      # Check if the requested date is newer than the latest existing file
      case find_latest_deck_log_file() do
        nil ->
          # No existing files, create new one
          handle_new_file_creation(new_file_path, file_stem_date_formatted, file_stem_day_of_week)
        latest_source_file ->
          latest_basename = Path.basename(latest_source_file)
          latest_date_part = String.slice(latest_basename, 0, 8)

          if actual_new_stem > latest_date_part do
            # Requested date is newer than latest, create new file
            handle_new_file_creation(new_file_path, file_stem_date_formatted, file_stem_day_of_week)
          else
            # Requested date is older than or equal to latest, just touch the latest file
            IO.puts("Requested date #{actual_new_stem} is not newer than latest file date #{latest_date_part}.")
            IO.puts("Touching latest file: #{latest_source_file}")
            File.touch!(latest_source_file)
          end
      end
    end
  end

  defp handle_new_file_creation(new_file_path, file_stem_date_formatted, file_stem_day_of_week) do
    case find_latest_deck_log_file() do
      nil ->
        create_basic_template(new_file_path, file_stem_date_formatted, file_stem_day_of_week)
      latest_source_file ->
        copy_and_update_file(latest_source_file, new_file_path, file_stem_date_formatted, file_stem_day_of_week)
    end

    IO.puts("Please review and edit #{new_file_path} as needed.")
  end

  defp find_latest_deck_log_file() do
    pattern = Path.join([@changelog_dir, "**", "*-deck-log.md"])

    case Path.wildcard(pattern) do
      [] ->
        nil
      files ->
        # Sort by filename date (newest first) - extract YYYYMMDD from filename
        files
        |> Enum.map(fn file ->
          # Extract date from filename like "20250718-deck-log.md"
          basename = Path.basename(file)
          date_part = String.slice(basename, 0, 8)
          {file, date_part}
        end)
        |> Enum.filter(fn {_file, date_part} ->
          # Only include files with valid YYYYMMDD format
          Regex.match?(~r/^\d{8}$/, date_part)
        end)
        |> Enum.sort_by(fn {_file, date_part} -> date_part end, :desc)
        |> List.first()
        |> case do
          nil -> nil
          {file, _date} -> file
        end
    end
  end

  defp create_basic_template(new_file_path, file_stem_date_formatted, file_stem_day_of_week) do
    IO.puts("No existing .md file found in #{@changelog_dir}/ to use as a template.")
    IO.puts("Creating #{new_file_path} with a basic template.")

    content = """
    # V-Sekai Deck Log - #{file_stem_date_formatted} (#{file_stem_day_of_week})

    Date: #{file_stem_date_formatted}

    - Initial entry.
    """

    File.write!(new_file_path, content)
    IO.puts("Created new file: #{new_file_path}")
  end

  defp copy_and_update_file(latest_source_file, new_file_path, file_stem_date_formatted, file_stem_day_of_week) do
    IO.puts("Copying from latest file: #{latest_source_file} to #{new_file_path}")
    File.cp!(latest_source_file, new_file_path)

    IO.puts("Updating date placeholder '%%DATE%%' to '#{file_stem_date_formatted}' and '%%DAY_OF_WEEK%%' to '#{file_stem_day_of_week}' in #{new_file_path}")

    content = File.read!(new_file_path)

    # Replace date placeholders
    updated_content = content
    |> String.replace("%%DATE%%", file_stem_date_formatted)
    |> String.replace("%%DAY_OF_WEEK%%", file_stem_day_of_week)

    IO.puts("Ensuring H1 title is updated to '#{file_stem_date_formatted} (#{file_stem_day_of_week})'")

    # Update H1 title line
    final_content = Regex.replace(
      ~r/^# V-Sekai Deck Log - .*/m,
      updated_content,
      "# V-Sekai Deck Log - #{file_stem_date_formatted} (#{file_stem_day_of_week})"
    )

    File.write!(new_file_path, final_content)
    IO.puts("File copied and date updated: #{new_file_path}")
  end
end

# Run the main function with command line arguments
ChangelogCreator.main(System.argv())
