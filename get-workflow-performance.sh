#!/bin/bash

# Get performance numbers for the workflow
# Update this number for various workflows
WORKFLOW_ID=179135846
REPO="hiero-ledger/hiero-consensus-node"
START_DATE="2025-06-01"
END_DATE="2025-10-20"

# Initialize the current start date
current="$START_DATE"

while [[ "$current" < "$END_DATE" ]]; do
  # Compute the first day of the next month
  next=$(date -j -v +1m -f "%Y-%m-%d" "$current" "+%Y-%m-%d")

  # Adjust end of interval if it goes beyond END_DATE
  interval_end="$next"
  if [[ "$next" > "$END_DATE" ]]; then
    interval_end="$END_DATE"
  fi

  echo "---------------------------------------------"
  echo "Fetching runs from $current to $interval_end..."

  # Build URL safely to avoid '?' globbing
  QUERY="/repos/${REPO}/actions/workflows/${WORKFLOW_ID}/runs?branch=main&per_page=100&created=${current}..${interval_end}"

  # Fetch runs
  count=$(gh api -H "Accept: application/vnd.github+json" "$QUERY" \
    --paginate \
    | jq -r '
        .workflow_runs[]
        | .status + "," + .conclusion
      ' | tee -a "runs.csv" | wc -l)

  echo "Fetched $count runs for this interval."

  # Move to next interval
  current="$next"
done

echo "---------------------------------------------"
echo "Done! All runs saved to runs.csv."
