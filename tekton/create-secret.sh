#!/bin/bash

# Set variables
NAMESPACE=$(oc project -q)
REGISTRY_SERVER=image-registry.openshift-image-registry.svc:5000
SECRET_NAME=registry-secret

oc policy add-role-to-user registry-editor system:serviceaccount:${NAMESPACE}:pipeline

oc delete secret $SECRET_NAME

# Get the secret name for the 'pipeline' service account
SECRET=$(oc get sa pipeline -o jsonpath='{.secrets[0].name}')

# Extract the token from the secret
TOKEN=$(oc get secret $SECRET -o json | jq -r '.data.token' | base64 -d)

if [[ -z "$TOKEN" ]]; then
    echo "Failed to retrieve the token."
    exit 1
fi

# Create the Docker registry secret
oc create secret docker-registry $SECRET_NAME \
    --docker-server=$REGISTRY_SERVER \
    --docker-username=serviceaccount \
    --docker-password=$TOKEN \
    --docker-email=unused \
    -n $NAMESPACE

# If you wish, you can patch the service account to automatically include this secret for future builds/pods:
# oc patch serviceaccount pipeline -p '{"imagePullSecrets": [{"name": "'$SECRET_NAME'"}]}'

echo "Docker registry secret $SECRET_NAME created successfully."
