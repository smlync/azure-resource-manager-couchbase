#!/bin/sh

PARAMETERS_FILE=$1
RESOURCE_GROUP=$2
default='westus'
REGION=${3-$default}

az group deployment create --template-file uniqueString.json --resource-group $RESOURCE_GROUP --output table

#python deployment_ms.py parameters/${PARAMETERS_FILE}.yaml
#az group create --name $RESOURCE_GROUP --location $REGION --output table
az group deployment create -n NonRallyDeployment --mode Incremental --verbose --template-file generatedTemplate_nonRally_mojio.json --parameters @parameters/parameters.json --resource-group $RESOURCE_GROUP --output table
