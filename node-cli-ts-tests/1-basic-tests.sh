#!/bin/sh

# Setup
ERROR="\u001b[31m"
SUCCESS="\u001b[32m"
CLEAR="\u001b[0m"

# Run some basic tests

echo "Basic test when name is provided as cli arg"
RESULT_1=$(node node-cli-ts/dist/index.js --name=test)
EXPECTED_OUTPUT_1="Hello, test"

if [[ $RESULT_1 == $EXPECTED_OUTPUT_1 ]]
then
    echo -e ${SUCCESS}PASSED${CLEAR}
else
    echo -e ${ERROR}FAILED${CLEAR}
    echo "Expected: $EXPECTED_OUTPUT_1"
    echo "Received: $RESULT_1"
    diff <(echo $EXPECTED_OUTPUT_1) <(echo $RESULT_1)
    exit 1
fi

echo ==================================================

echo "Basic test when a different name is provided as cli arg"
RESULT_1=$(node node-cli-ts/dist/index.js --name="world!")
EXPECTED_OUTPUT_1="Hello, world!"

if [[ $RESULT_1 == $EXPECTED_OUTPUT_1 ]]
then
    echo -e ${SUCCESS}PASSED${CLEAR}
else
    echo -e ${ERROR}FAILED${CLEAR}
    echo "Expected: $EXPECTED_OUTPUT_1"
    echo "Received: $RESULT_1"
    diff <(echo $EXPECTED_OUTPUT_1) <(echo $RESULT_1)
    exit 1
fi