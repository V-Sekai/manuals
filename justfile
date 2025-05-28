# Creates a new changelog file from the most recent one, or a new template.
# Usage: just create-changelog-entry [new_filename_stem]
# If new_filename_stem is not provided, it defaults to today's date (YYYYMMDD).
# The new_filename_stem should be in YYYYMMDD format if provided.
# Example: just create-changelog-entry 20250426
# Example: just create-changelog-entry (uses today's date, e.g., 20250527, as the stem)
# This will create changelog/YYYY/YYYYMMDD-deck-log.md (e.g., changelog/2025/20250527-deck-log.md)
# and replace '%%DATE%%' in it with today's date (YYYY-MM-DD).
create-changelog-entry new_stem=`date +%Y%m%d`:
    #!/usr/bin/env bash
    set -euo pipefail # Exit on error, undefined variable, or pipe failure

    # Ensure new_stem is set. If 'just' provides it, that value is used.
    # Otherwise, it defaults to current date in YYYYMMDD, similar to the 'just' parameter default.
    actual_new_stem="${new_stem:-$(date +%Y%m%d)}"

    CHANGELOG_DIR="changelog"
    # new_stem (now actual_new_stem) is an environment variable passed by 'just' (e.g., "20250527" if today is May 27, 2025)
    # It will be in YYYYMMDD format.
    YEAR_PART="${actual_new_stem:0:4}" # Extracts YYYY from actual_new_stem, e.g., "2025"
    TARGET_SUBDIR="${CHANGELOG_DIR}/${YEAR_PART}" # e.g., "changelog/2025"
    
    NEW_FILE_PATH="${TARGET_SUBDIR}/${actual_new_stem}-deck-log.md" # e.g., "changelog/2025/20250527-deck-log.md"
    TODAY_DATE=$(date +%F) # Format: YYYY-MM-DD, for %%DATE%% replacement
    TODAY_DAY_OF_WEEK=$(date +%A) # Format: Full weekday name, e.g., Tuesday

    # Ensure changelog year directory exists
    mkdir -p "${TARGET_SUBDIR}"

    if [ -f "${NEW_FILE_PATH}" ]; then
        echo "File ${NEW_FILE_PATH} already exists. Updating its timestamp."
        touch "${NEW_FILE_PATH}"
    else
        # Find the newest -deck-log.md file in any subdirectory of changelog by name (version/date sort)
        # If no .md files, LATEST_SOURCE_FILE will be empty.
        LATEST_SOURCE_FILE=$(find "${CHANGELOG_DIR}" -type f -name '*-deck-log.md' -print0 2>/dev/null | xargs -0 ls -1tv 2>/dev/null | head -n 1 || true)

        if [ -z "$LATEST_SOURCE_FILE" ]; then
            echo "No existing .md file found in ${CHANGELOG_DIR}/ to use as a template."
            echo "Creating ${NEW_FILE_PATH} with a basic template."
            # Use shell variable $actual_new_stem for the content, which holds YYYYMMDD
            echo -e "# Changelog for ${actual_new_stem}\\n\\nDate: ${TODAY_DATE}\\n\\n- Initial entry." > "${NEW_FILE_PATH}"
            echo "Created new file: ${NEW_FILE_PATH}"
        else
            echo "Copying from latest file: ${LATEST_SOURCE_FILE} to ${NEW_FILE_PATH}"
            cp "${LATEST_SOURCE_FILE}" "${NEW_FILE_PATH}"

            echo "Updating date placeholder '%%DATE%%' to '${TODAY_DATE}' and '%%DAY_OF_WEEK%%' to '${TODAY_DAY_OF_WEEK}' in ${NEW_FILE_PATH}"
            # This sed command works on macOS and Linux. It replaces '%%DATE%%' and '%%DAY_OF_WEEK%%'.
            # Adjust placeholders if your files use different ones.
            sed -i.bak -e "s/%%DATE%%/${TODAY_DATE}/g" -e "s/%%DAY_OF_WEEK%%/${TODAY_DAY_OF_WEEK}/g" "${NEW_FILE_PATH}"
            rm -f "${NEW_FILE_PATH}.bak" # Clean up the backup file created by sed

            echo "File copied and date updated: ${NEW_FILE_PATH}"
        fi
        echo "Please review and edit ${NEW_FILE_PATH} as needed."
    fi

default:
    @python3 fire_votes.py
