#!/usr/bin/env bash

echo "Running pre-commit hook"
./bin/run-compile-check.bash

# $? stores exit value of the last command
if [ $? -ne 0 ]; then
 echo "Reports must be correct before committing"
 exit 1
fi
