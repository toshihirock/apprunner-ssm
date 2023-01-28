# How to set up

+ Execte "CreateActivation" API.

```
aws ssm create-activation \
    --default-instance-name apprunner \
    --iam-role service-role/AmazonEC2RunCommandRoleForManagedInstances \
    --registration-limit 10 \
    --region ap-northeast-1 \
    --expiration-date "2023-02-20T00:00:00"

{
    "ActivationId": "ABC",
    "ActivationCode": "XYZ"
}

```

+ Copy "ActivationId" and "ActivationCode"
+ Creaet AppRunner service
    + Environment variable
        + SSM_AGENT_ID:${ActivationId}
        + SSM_AGENT_CODE:${ActivationCode}
        + AWS_DEFAULT_REGION:${REGION}

# Local test

```
docker run -d -e SSM_AGENT_ID=ABC -e SSM_AGENT_CODE=XYZ -e AWS_DEFAULT_REGION=ap-northeast-1 apprunner-ssm
```

# Troubleshooting


