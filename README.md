# How to set up

+ Build and push for ECR
+ Execute "CreateActivation" API.

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
    + Port
        + 80
    + (Optional)Instance role
+ Check application log in the App Runner and find "mi-xxxx",
+ Execute "start-session" command,

```
aws ssm start-session --target mi-xxxxx

# List your S3 buckets.It will take some time for it to appear
$aws s3 ls
```

# Local test

```
docker run -d -e SSM_AGENT_ID=ABC -e SSM_AGENT_CODE=XYZ -e AWS_DEFAULT_REGION=ap-northeast-1 apprunner-ssm
```

# Troubleshooting

+ "Unable to start shell: failed to start pty since RunAs user xyz does not exist"
    + [Why can’t I connect to my Amazon EC2 instance using Session Manager?](https://aws.amazon.com/premiumsupport/knowledge-center/ssm-session-manager-connect-fail)
    + Also, please check below in the management console.
        + Session Manager
        + Preferences
        + Disable "Enable Run As support for Linux instances" in specify Operating System user for sessions.


