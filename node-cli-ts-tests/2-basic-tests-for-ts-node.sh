#!/bin/bash

# Setup
ERROR="\u001b[31m"
SUCCESS="\u001b[32m"
CLEAR="\u001b[0m"

# Run some basic tests

echo "Basic test when name is provided as cli arg"
RESULT=$(cd node-cli-ts && npm run start -- --name=test)
# Output also has npm/ts-node stuff
EXPECTED_RESULT="
> cli-ts@1.0.0 start
> ts-node src/index.ts --name=test

Hello, test"

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
RESULT=$(cd node-cli-ts && npm run start -- --name="world!")
EXPECTED_RESULT="
> cli-ts@1.0.0 start
> ts-node src/index.ts --name=world!

Hello, world!"

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
