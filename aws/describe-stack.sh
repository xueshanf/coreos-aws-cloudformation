#!/bin/bash

SCRIPT_PATH=$( cd $(dirname $0) ; pwd -P )

STACK_NAME=${1}
[[ -z "$STACK_NAME" ]] && echo "Stack name is required" && exit 1

echo "Checking stack: $STACK_NAME"

# Describe named stack
aws cloudformation describe-stacks --stack-name $STACK_NAME
