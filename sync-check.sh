#!/bin/bash

# Repository Sync Checker

echo "======================================="
echo "Repository Sync Check"
echo "======================================="
echo ""

# Current branch
CURRENT_BRANCH=$(git branch --show-current)
echo "Current branch: $CURRENT_BRANCH"
echo ""

# Fetch latest
echo "Fetching latest changes..."
git fetch origin
echo ""

# Check if behind remote
LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse @{u} 2>/dev/null)
BASE=$(git merge-base @ @{u} 2>/dev/null)

if [ "$LOCAL" = "$REMOTE" ]; then
    echo "Up to date with remote"
elif [ "$LOCAL" = "$BASE" ]; then
    BEHIND=$(git rev-list --count $LOCAL..$REMOTE)
    echo "Behind remote by $BEHIND commits"
    echo ""
    echo "Recent remote changes:"
    git log --oneline HEAD..@{u}
    echo ""
    echo "Run 'git pull' to update"
elif [ "$REMOTE" = "$BASE" ]; then
    AHEAD=$(git rev-list --count $REMOTE..$LOCAL)
    echo "Ahead of remote by $AHEAD commits"
    echo ""
    echo "Your local commits:"
    git log --oneline @{u}..HEAD
    echo ""
    echo "Run 'git push' to share your changes"
else
    AHEAD=$(git rev-list --count $REMOTE..$LOCAL)
    BEHIND=$(git rev-lsit --count $LOCAL..$REMOTE)
    echo "Diverged from remote"
    echo "  You are $AHEAD commits ahead"
    echo "  You are $BEHIND commits behind"
    echo ""
    echo "Run 'git pull' to sync (may require merge)"
fi

echo ""
echo "======================================="
