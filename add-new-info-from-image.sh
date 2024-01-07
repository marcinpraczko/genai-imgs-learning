#!/bin/bash

# Script for simple ORG context generation

set -ueo pipefail

LCD=$(pwd)
DOCS_DIR=docs
ORG_FILE=index.org

function usage() {
    cat << EOF

Usage:
    ./$0 <<file_name>>

Examples:
    Add all files with 007 prefix
    ./$0 007

    Add all files with 009 prefix
    ./$0 009

Please download images first with pattern 001-1.jpeg, 002-1.jpeg, etc.
Provide prefix to script - so it can read all images with prefix and create proper context.

EOF
}

# Generate ORG context and add it to current file
function gen_org_context() {
    filename_prefix="$1"

    echo "Adding details to file: ${ORG_FILE}"
    echo "Processing files with prefix: ${filename_prefix}..."
    files=$(ls img/${filename_prefix}*)
    echo "Found files:"
    echo "${files}"

    echo "+ Adding header"
    cat << EOF >> "${ORG_FILE}"

** TODO ${filename_prefix} Add info here

*** TODO AI Prompt

Copy AI Prompt here

*** TODO Notes

Add some notes here

*** Downloaded images

EOF

    for fn in ${files}; do
        echo "+ Adding file: ${fn}"
        echo "**** ${fn}" >> "${ORG_FILE}"
        echo "" >> "${ORG_FILE}"
        echo "[[./${fn}]]" >> "${ORG_FILE}"
        echo "" >> "${ORG_FILE}"
    done
}

# --- MAIN CODE ---
# Check if the required parameter is provided
if [ "$#" -ne 1 ]; then
    usage
    exit 1
fi

# Get the filename from the command line argument
file_name="$1"

# Your script logic goes here
cd "${DOCS_DIR}"
gen_org_context "${file_name}"
cd "${LCD}"
