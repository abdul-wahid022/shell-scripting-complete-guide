#!/bin/bash

# test_framework.sh
# Description: A simple test to verify the hello_world.sh script works.
# Usage: ./test_framework.sh

echo "🧪 Running Simple Test"
echo "====================="

# Test 1: Check if hello_world.sh exists
TEST_SCRIPT="../01-basics/hello_world.sh"

if [ ! -f "$TEST_SCRIPT" ]; then
    echo "❌ FAIL: Test script not found: $TEST_SCRIPT"
    exit 1
fi
echo "✅ PASS: Script found."

# Test 2: Check if it's executable
if [ ! -x "$TEST_SCRIPT" ]; then
    echo "❌ FAIL: Script is not executable."
    exit 1
fi
echo "✅ PASS: Script is executable."

# Test 3: Run the script and check for expected output
OUTPUT=$("$TEST_SCRIPT")
if echo "$OUTPUT" | grep -q "Hello, World!"; then
    echo "✅ PASS: Script printed 'Hello, World!'"
else
    echo "❌ FAIL: Script output did not contain 'Hello, World!'"
    echo "Output was: $OUTPUT"
    exit 1
fi

echo -e "\n🎉 All tests passed! The basic setup is working correctly."
