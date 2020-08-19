#!/bin/bash

ACTION=$1
STACK="project-jenkins"
TEMPLATE="jenkins.yaml"
PARAMS="parameters.json"

./run.sh $ACTION $STACK $TEMPLATE $PARAMS
