// Rights Reserved, Unlicensed

# 🟩 Lambda & API Gateway IAM Policies

IAM policies governing Lambda execution, API Gateway access, KMS decryption, logging, and S3 read/write operations for EncryptHealth.

These policies support least-privilege principles and are referenced by Terraform modules.

---

## 1. Lambda Execution Role Policy (Core)

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "*"
    }
  ]
}

{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "S3Access",
      "Effect": "Allow",
      "Action": [
        "s3:GetObject",
        "s3:PutObject"
      ],
      "Resource": [
        "arn:aws:s3:::encrypthlth-coa-files/*"
      ]
    }
  ]
}
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "DynamoWrite",
      "Effect": "Allow",
      "Action": [
        "dynamodb:PutItem",
        "dynamodb:UpdateItem"
      ],
      "Resource": [
        "arn:aws:dynamodb:us-east-1:000000000000:table/encrypthlth-session-store",
        "arn:aws:dynamodb:us-east-1:000000000000:table/encrypthlth-consent-store"
      ]
    }
  ]
}
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowDecrypt",
      "Effect": "Allow",
      "Action": [
        "kms:Decrypt"
      ],
      "Resource": [
        "arn:aws:kms:us-east-1:000000000000:key/encrypthlth-lambda-cmk"
      ]
    }
  ]
}
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "InvokeLambda",
      "Effect": "Allow",
      "Action": [
        "lambda:InvokeFunction"
      ],
      "Resource": [
        "arn:aws:lambda:us-east-1:000000000000:function:encrypthlth-api"
      ]
    }
  ]
}
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "APIGatewayLogs",
      "Effect": "Allow",
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "*"
    }
  ]
}
