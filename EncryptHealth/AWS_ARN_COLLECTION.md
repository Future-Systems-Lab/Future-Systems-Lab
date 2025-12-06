// Rights Reserved, Unlicensed

# 🟦 AWS ARN Collection

Centralized index of all AWS ARNs required for EncryptHealth infrastructure, governance, and Terraform modules.

This file is expanded as new resources are created.

---

## 1. S3 Buckets
- arn:aws:s3:::encrypthlth-coa-files
- arn:aws:s3:::encrypthlth-coa-files/*
- arn:aws:s3:::encrypthlth-governance-logs
- arn:aws:s3:::encrypthlth-governance-logs/*

---

## 2. KMS Keys (CMK)
- arn:aws:kms:us-east-1:000000000000:key/encrypthlth-master-cmk
- arn:aws:kms:us-east-1:000000000000:key/encrypthlth-s3-cmk
- arn:aws:kms:us-east-1:000000000000:key/encrypthlth-lambda-cmk

---

## 3. CloudWatch Log Groups
- arn:aws:logs:us-east-1:000000000000:log-group:/aws/lambda/encrypthlth-api
- arn:aws:logs:us-east-1:000000000000:log-group:/aws/apigateway/encrypthlth-gateway
- arn:aws:logs:us-east-1:000000000000:log-group:/aws/events/encrypthlth-scheduler

---

## 4. Lambda Functions
- arn:aws:lambda:us-east-1:000000000000:function:encrypthlth-api
- arn:aws:lambda:us-east-1:000000000000:function:encrypthlth-session-writer
- arn:aws:lambda:us-east-1:000000000000:function:encrypthlth-consent-writer

---

## 5. API Gateway
- arn:aws:apigateway:us-east-1::/restapis/encrypthlth-api
- arn:aws:apigateway:us-east-1::/restapis/encrypthlth-api/stages/prod
- arn:aws:apigateway:us-east-1::/restapis/encrypthlth-api/stages/dev

---

## 6. IAM Roles
- arn:aws:iam::000000000000:role/encrypthlth-lambda-role
- arn:aws:iam::000000000000:role/encrypthlth-apigateway-role
- arn:aws:iam::000000000000:role/encrypthlth-governance-ci-role

---
