# local-api-gateway

Dockerized AWS SAM local api-gateway

## SAM base image versions

From local-api-gateway:2.0 the base images are taken from [AWS SAM serverless-image-repositories](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-image-repositories.html).

- danwhitfieldsykes/local-api-gateway:1.0 -> amazon/aws-sam-cli-build-image-python3.8
- danwhitfieldsykes/local-api-gateway:2.0 -> public.ecr.aws/sam/build-python3.12

## Usage

### Docker Build/Push

#### Main Image

```bash
docker build -t danwhitfieldsykes/local-api-gateway:2.0 .
docker push danwhitfieldsykes/local-api-gateway:2.0
```

#### Debug Image

```bash
docker build -f Dockerfile-debug -t danwhitfieldsykes/local-api-gateway-debug:2.0 .
docker push danwhitfieldsykes/local-api-gateway-debug:2.0
```

### Docker Compose

```yaml
local-api:
image: local-api-gateway:2.0
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

### Debug

There is a separate `Dockerfile-debug` which builds an image which will start the AWS SAM debugger.
