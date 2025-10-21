#!/bin/bash

# Process the runs.csv file
echo "Total:$(cat runs.csv | wc -l)"
echo "Successes:  $(grep -c ',success' runs.csv)"
echo "Failures:   $(grep -c ',failure' runs.csv)"
echo "Cancelled:  $(grep -c ',cancelled' runs.csv)"
