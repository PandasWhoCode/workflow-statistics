## Process

Run the `get-all-workflows.sh` file to get a list of all workflows.
The output will be `workflow_list.json`.

Update the `get-workflow-performance.sh` workflow ID variable to the variable you'd like to get status on.
The output will be in `runs.csv`.

Next, we process the output of `runs.csv` using `process-stats.sh`.

Finally rename the `runs.csv` to `mats_runs.csv` or similar if you'd like to keep the files around for history.

## Notes

- Work from June 1st, when MATS and XTS were updated.