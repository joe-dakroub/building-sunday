#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

if [[ $# -ge 1 ]]; then
  week="$1"
else
  latest=$(ls _posts/*-week-*.md 2>/dev/null | sort | tail -n1)
  if [[ -z "$latest" ]]; then
    echo "No _posts/*-week-*.md found. Pass week number as an argument: $0 <N>" >&2
    exit 1
  fi
  week=$(basename "$latest" | sed -E 's/.*-week-([0-9]+)\.md/\1/')
fi

git add _posts/
git commit -m "Week $week journal"
git push
