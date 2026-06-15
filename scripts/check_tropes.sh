#!/usr/bin/env bash
# Static, no-LLM tropes check enforcing https://tropes.fyi/ house style.
# Flags the most common AI-writing tells with conservative regexes — each needs
# enough context that ordinary prose does not trip it. Rule groups:
#   parallelism  negative parallelism: "not X, but/it's Y" and the em-dash reframe
#   bold-list    a bullet/number opening with a **bold label** then a :, ., or —
#   serves-as    the "serves as a …" dodge
#   fragment     rhetorical fragments: "Not X. Not Y. …" and "The X? A Y."
#   cliche       overused AI vocabulary ("delve", "tapestry", "testament to", …)
set -uo pipefail

# Skip _archive/ — unpublished, historical decisions kept verbatim, not rewritten.
mapfile -t files < <(git ls-files '*.md' '*.qmd' | grep -v '^_archive/')
[ "${#files[@]}" -eq 0 ] && { echo "tropes check: no markdown files"; exit 0; }

# Negative parallelism — each pattern requires BOTH halves so plain "is not X"
# prose does not trip it.
parallelism=(
  "(it'?s|that'?s|this is|here'?s)[[:space:]]+not[[:space:]]+[^.!?]{1,80}[[:space:]]it'?s[[:space:]]"
  "\bnot[[:space:]]+(just|only|merely|simply)[[:space:]]+[^.!?]{1,80}[[:space:]](but|rather)\b"
  "\bnot[[:space:]]+because[[:space:]]+[^.!?]{1,80}[[:space:]]but\b"
  "\bthe[[:space:]]+(question|point|issue|goal|problem)[[:space:]]+isn'?t\b"
  "\bnot[[:space:]]+[^.!?—]{1,80}—[[:space:]]*(it'?s|but|rather)\b"
)

# A bolded list label followed by a colon, period, or em/en-dash (or "--") is the
# tell, whichever side the punctuation sits: "**Term:**", "**Term**:", "**Term.**",
# "**Term**.", and "**Term** —". Drop the bold and write the item as a sentence.
bold_list=(
  '^[[:space:]]*([-*+]|[0-9]+\.)[[:space:]]+\*\*[^*]+\*\*[[:space:]]*[:.]'
  '^[[:space:]]*([-*+]|[0-9]+\.)[[:space:]]+\*\*[^*]*[:.]\*\*'
  '^[[:space:]]*([-*+]|[0-9]+\.)[[:space:]]+\*\*[^*]+\*\*[[:space:]]*(—|–|--)'
)

# The "serves as a …" dodge — "the building serves as a reminder of …".
serves_as=(
  '\bserves as (a|an|the)\b'
)

# Rhetorical fragments: the "Not X. Not Y. Just Z." cascade and the "The X? A Y."
# question-then-fragment. Capitalisation is part of the tell, so case-sensitive.
fragments=(
  '\bNot [^.!?]{1,50}\.[[:space:]]+Not [^.!?]{1,50}\.'
  '(^|[.!?][[:space:]])The [^.!?]{1,40}\?[[:space:]]+[A-Z]'
)

# Overused AI vocabulary / cliché phrases (tropes.fyi Word Choice + Tone).
cliches=(
  '\bdelv(e|es|ing|ed)\b'
  '\btapestry\b'
  '\btestament to\b'
  '\bnavigat[a-z]* the complexit'
  '\bgame[ -]?changer'
  '\bplays? a (crucial|vital|pivotal|key|central) role'
  '\bin the realm of\b'
  '\bunlock[a-z]* the (power|potential|secret)'
  '\bharness[a-z]* the power'
  '\bever-(evolving|changing|growing|expanding)\b'
  '\ba wealth of\b'
  "it'?s worth noting"
  "in today'?s [a-z -]{0,25}(paced|world|landscape|age)"
)

found=0

# scan LABEL CASE PATTERN...  (CASE = "i" for case-insensitive, anything else for
# case-sensitive). Runs in the current shell so `found` survives.
scan() {
  local label=$1 case=$2; shift 2
  local flag="" f p
  [ "$case" = "i" ] && flag="i"
  for f in "${files[@]}"; do
    for p in "$@"; do
      while IFS= read -r line; do
        echo "tropes($label): $f:$line"
        found=1
      done < <(grep -nE${flag} "$p" "$f" 2>/dev/null)
    done
  done
}

scan parallelism i "${parallelism[@]}"
scan bold-list   s "${bold_list[@]}"
scan serves-as   i "${serves_as[@]}"
scan fragment    s "${fragments[@]}"
scan cliche      i "${cliches[@]}"

if [ "$found" -ne 0 ]; then
  echo
  echo "AI-tell phrasing found (see https://tropes.fyi/)."
  echo "  parallelism: rewrite \"not X, but/it's Y\" as a plain declarative statement."
  echo "  bold-list:   drop the bold lead-in; write the list item as a sentence."
  echo "  serves-as:   say what it does directly instead of \"serves as a …\"."
  echo "  fragment:    write full sentences, not \"Not X. Not Y.\" / \"The X? A Y.\"."
  echo "  cliche:      replace the flagged AI cliché with plain, specific wording."
  exit 1
fi
echo "tropes check: clean (${#files[@]} files)"
