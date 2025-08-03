#!/usr/bin/env bash

# Test script specifically for the help command

echo "Testing help command implementation..."

# Test 1: Basic help output
echo "Test 1: Basic help output"
HELP_OUTPUT=$(../ethd-modular --help)
if echo "$HELP_OUTPUT" | grep -q "usage: ./ethd-modular"; then
    echo "✅ Basic help shows correct usage"
else
    echo "❌ Basic help doesn't show correct usage"
    exit 1
fi

# Test 2: Help command explicitly
echo "Test 2: Help command explicitly"
HELP_OUTPUT=$(../ethd-modular help)
if echo "$HELP_OUTPUT" | grep -q "commands:"; then
    echo "✅ Help command works"
else
    echo "❌ Help command doesn't work"
    exit 1
fi

# Test 3: Update help
echo "Test 3: Update help"
UPDATE_HELP_OUTPUT=$(../ethd-modular help update)
if echo "$UPDATE_HELP_OUTPUT" | grep -q "usage: ./ethd-modular update"; then
    echo "✅ Update help works"
else
    echo "❌ Update help doesn't work"
    exit 1
fi

# Test 4: Verify key commands are listed
echo "Test 4: Key commands verification"
HELP_OUTPUT=$(../ethd-modular --help)
REQUIRED_COMMANDS=("install" "config" "keys" "update" "up|start" "down|stop" "restart" "version" "logs" "cmd" "terminate")

for cmd in "${REQUIRED_COMMANDS[@]}"; do
    if echo "$HELP_OUTPUT" | grep -q "$cmd"; then
        echo "✅ Command '$cmd' is listed in help"
    else
        echo "❌ Command '$cmd' is missing from help"
        exit 1
    fi
done

# Test 5: Verify support information is present
echo "Test 5: Support information verification"
if echo "$HELP_OUTPUT" | grep -q "ethstaker/eth-docker"; then
    echo "✅ GitHub link is present"
else
    echo "❌ GitHub link is missing"
    exit 1
fi

if echo "$HELP_OUTPUT" | grep -q "discord.gg/ethstaker"; then
    echo "✅ Discord link is present"
else
    echo "❌ Discord link is missing"
    exit 1
fi

echo "All help command tests passed!"