#!/bin/bash

SCRIPT_PATH=$( cd $(dirname $0) ; pwd -P )

STACK_NAME=${1}
[[ -z "$STACK_NAME" ]] && echo "Stack name is required" && exit 1

echo "Deleting  CloudFormation Stack with these parameters:"
echo "Name: $STACK_NAME"

# Validate stack's existence
aws cloudformation describe-stacks --stack-name $STACK_NAME && aws cloudformation delete-stack  --stack-name $STACK_NAME
