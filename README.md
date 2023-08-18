# local-api-gateway

Dockerized AWS SAM local api-gateway

## Usage

### Docker Build

```bash
docker build -t local-api-gateway:1.0
```

### Docker Compose

```yaml
local-api:
image: local-api-gateway:1.0
ports:
    - '3000:3000'
environment:
    - AWS_REGION=ap-southeast-2
    - SAM_TEMPLATE_FILE=/app/cdk.out/<YOUR API CLOUDFORMATION TEMPLATE FILE>.json
    - ENV_FILE=/app/resources/env.json
    - CDK_OUT_ABSOLUTE_PATH=${PWD}/cdk.out
    - SAM_CLI_TELEMETRY=0
    - DOCKER_NETWORK=<YOUR DOCKER NETWORK NAME>
volumes:
    - '/var/run/docker.sock:/var/run/docker.sock'
    - './cdk.out:/app/cdk.out'
    - './resources:/app/resources'
```
