#!/bin/bash

set -o errexit

sam local start-api \
    --host 0.0.0.0 \
    --container-host-interface 0.0.0.0 \
    --container-host host.docker.internal \
    --docker-volume-basedir $CDK_OUT_ABSOLUTE_PATH \
    --docker-network $DOCKER_NETWORK \
    --region $AWS_REGION \
    --template $SAM_TEMPLATE_FILE \
    --env-vars $ENV_FILE \
    --debug-port ${DEBUG_PORT:-5858}
