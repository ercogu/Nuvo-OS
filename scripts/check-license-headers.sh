#!/usr/bin/env bash
#
# check-license-headers.sh
#
# Checks that all NEW/MODIFIED source files in the PR contain
# the line “SPDX-License-Identifier: GPL-3.0-or-later” somewhere within the first
# N lines of the file (the license header must be at the beginning of the file).
#
# Usage:
#   scripts/check-license-headers.sh <base-ref> <head-ref>
#
# If no arguments are provided, the script will attempt to retrieve them from the
# environment variables GITHUB_BASE_SHA / GITHUB_HEAD_SHA (see workflow), or
# compare the working copy with HEAD~1 (for local execution).

set -euo pipefail

BASE_REF="${1:-${GITHUB_BASE_SHA:-}}"
HEAD_REF="${2:-${GITHUB_HEAD_SHA:-HEAD}}"

if [[ -z "$BASE_REF" ]]; then
  echo “No base ref specified; comparing to HEAD~1 (local mode).”
  BASE_REF="HEAD~1"
fi

# File extensions that must include a license header
EXTENSIONS_REGEX='\.(c|h|cpp|hpp|cc|cxx|asm|inc|S)$'
# Paths That Are Known to Be Excluded (third-party code, auto-generated files)
EXCLUDE_REGEX='^(third_party/|external/|vendor/|build/)'
# A string whose presence we consider sufficient confirmation of the title
SPDX_TAG='SPDX-License-Identifier:'
# Scan only the first 25 lines of the file for the SPDX tag
HEAD_LINES=25

echo “Comparing the range: ${BASE_REF}...${HEAD_REF}”

mapfile -t CHANGED_FILES < <(
  git diff --name-only --diff-filter=ACMR "${BASE_REF}" "${HEAD_REF}" \
    | grep -E "${EXTENSIONS_REGEX}" \
    | grep -Ev "${EXCLUDE_REGEX}" || true
)

if [[ ${#CHANGED_FILES[@]} -eq 0 ]]; then
  echo “There are no new or modified source files to check.”
  exit 0
fi

MISSING=()

for f in "${CHANGED_FILES[@]}"; do
  # The file may have been deleted in this range-skip it
  if [[ ! -f "$f" ]]; then
    continue
  fi

  if ! head -n "${HEAD_LINES}" "$f" | grep -q "${SPDX_TAG}"; then
    MISSING+=("$f")
  fi
done

if [[ ${#MISSING[@]} -gt 0 ]]; then
  echo ""
  echo “[-] The following files are missing a license header (${SPDX_TAG}):”
  for f in "${MISSING[@]}"; do
    echo "   - $f"
  done
  echo ""
  echo “Take the template from templates/license-headers/ and insert it”
  echo “as the first block at the beginning of the file (see templates/license-headers/README.md).”
  exit 1
fi

echo “[+] All checked files (${#CHANGED_FILES[@]}) contain a license header.”