#!/bin/bash

# Get all workflows:
gh api \
  -H "Accept: application/vnd.github+json" \
  "/repos/hiero-ledger/hiero-consensus-node/actions/workflows?per_page=100" \
  --paginate \
  | jq '.workflows[] | {id, name, path}' > workflow_list.json
