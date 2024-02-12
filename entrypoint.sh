#!/bin/bash
set -e

RESULT=$(si-validator verify $INPUT_SECURITY_INSIGHTS_PATH $INPUT_SCHEMA_VERSION --json)
echo $RESULT
if [ "$RESULT" = "{\"errors\": []}" ]; then
    {
        echo "# SECURITY-INSIGHTS Validator 🦄"
        echo "## Results"
        echo "No errors found ✅"
    } >> "$GITHUB_STEP_SUMMARY"
    exit 0
else
    OUTPUT=$(output "$RESULT")
    {
        echo "# SECURITY-INSIGHTS Validator 🦄"
        echo "## Results"
        echo "### Errors"
        echo $OUTPUT
    } >> "$GITHUB_STEP_SUMMARY"
    exit 1
fi