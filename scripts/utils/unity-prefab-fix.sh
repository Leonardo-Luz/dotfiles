#!/usr/bin/env bash
# Usage: ./replace_guid.sh [--dry-run] <meta_file> <unity_file> <old_guid>

set -euo pipefail

dry_run=false

# Handle optional flag
if [[ "${1:-}" == "--dry-run" ]]; then
    dry_run=true
    shift
fi

if [[ "$#" -ne 3 ]]; then
    echo "Usage: $0 [--dry-run] <meta_file> <unity_file> <old_guid>"
    exit 1
fi

meta_file="$1"
unity_file="$2"
old_guid="$3"

# Validate paths
[[ -f "$meta_file" ]] || { echo "Error: Meta file not found: $meta_file"; exit 1; }
[[ -f "$unity_file" ]] || { echo "Error: Unity scene file not found: $unity_file"; exit 1; }

# Extract new GUID from meta
new_guid=$(awk '/^guid:/ {print $2}' "$meta_file")
[[ -n "$new_guid" ]] || { echo "Error: Could not extract GUID from $meta_file"; exit 1; }

echo "Old GUID: $old_guid"
echo "New GUID: $new_guid"
echo "Scene:    $unity_file"
echo ""

if $dry_run; then
    echo "Dry-run mode — lines that would be changed:"
    echo "------------------------------------------"
    grep --color=always -n "$old_guid" "$unity_file" || echo "(No matches found)"
    echo "------------------------------------------"
    echo "No changes made."
else
    echo "Applying changes..."
    cp "$unity_file" "$unity_file.bak"
    sed -i "s/${old_guid//\//\\/}/${new_guid//\//\\/}/g" "$unity_file"
    echo "Done! Backup created at: $unity_file.bak"
fi
