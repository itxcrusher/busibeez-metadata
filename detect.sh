#!/bin/bash
# Save this as detect_changes.sh and run it from your repo's root with: bash detect_changes.sh

# Compare the last commit with the previous commit
CHANGED_FILES=$(git diff --name-only HEAD~1 HEAD)

echo "Changed files in the last commit:"
echo "$CHANGED_FILES"
echo ""

# Loop through the directories and check if any file changed within them
for DIR in API JOBS SOCKETS; do
    echo "Detecting changes in the '$DIR' directory..."
    if echo "$CHANGED_FILES" | grep -q "^${DIR}/"; then
        echo "✅ The '$DIR' directory has changes."
    else
        echo "❌ No changes detected in the '$DIR' directory."
    fi
    echo ""
done
