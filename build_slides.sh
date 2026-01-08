#!/bin/bash

# Export slides to HTML using Marp CLI
if [ -z "$1" ]; then
    echo "Usage: $0 <slide_name> (e.g. me_rtl)"
    exit 1
fi

NAME="$1"
INPUT="${NAME}.md"
OUTPUT="${NAME}.html"

if command -v marp &> /dev/null; then
    CMD="marp"
elif command -v npx &> /dev/null; then
    echo "'marp' command not found. Trying via npx..."
    CMD="npx -y @marp-team/marp-cli"
else
    echo "Error: Marp CLI not found."
    echo "Please install it globally via npm: npm install -g @marp-team/marp-cli"
    exit 1
fi

echo "Exporting $INPUT to HTML..."
$CMD "$INPUT" --html -o "$OUTPUT"
echo "... done, created $OUTPUT."