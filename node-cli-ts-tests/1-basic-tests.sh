#!/bin/bash

# Setup
ERROR="\u001b[31m"
SUCCESS="\u001b[32m"
CLEAR="\u001b[0m"

# Run some basic tests

echo "Basic test when name is provided as cli arg"
RESULT=$(node node-cli-ts/dist/index.js --name=test)
EXPECTED_RESULT="Hello, test"

if [[ $RESULT == $EXPECTED_RESULT ]]
then
    echo -e ${SUCCESS}PASSED${CLEAR}
else
    echo -e ${ERROR}FAILED${CLEAR}
    echo "Expected: $EXPECTED_RESULT"
    echo "Received: $RESULT"
    diff <(echo $EXPECTED_RESULT) <(echo $RESULT)
    exit 1
fi

echo ==================================================

echo "Basic test when a different name is provided as cli arg"
RESULT=$(node node-cli-ts/dist/index.js --name="world!")
EXPECTED_RESULT="Hello, world!"

if [[ $RESULT == $EXPECTED_RESULT ]]
then
    echo -e ${SUCCESS}PASSED${CLEAR}
else
    echo -e ${ERROR}FAILED${CLEAR}
    echo "Expected: $EXPECTED_RESULT"
    echo "Received: $RESULT"
    diff <(echo $EXPECTED_RESULT) <(echo $RESULT)
    exit 1
fi

echo ==================================================

echo "First line of output file is node shebang"
RESULT=$(head -n 1 node-cli-ts/dist/index.js)
EXPECTED_RESULT="#!/usr/bin/env node"

if [[ $RESULT == $EXPECTED_RESULT ]]
then
    echo -e ${SUCCESS}PASSED${CLEAR}
else
    echo -e ${ERROR}FAILED${CLEAR}
    echo "Expected: $EXPECTED_RESULT"
    echo "Received: $RESULT"
    diff <(echo $EXPECTED_RESULT) <(echo $RESULT)
    exit 1
fi