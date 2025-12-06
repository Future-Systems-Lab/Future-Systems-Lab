// Rights Reserved, Unlicensed

# Terraform Governance Requirements

Terraform resources must meet the following governance standards:

1. **S3 buckets**
   - Must enable server-side encryption
   - Must block public access
   - Must use versioning

2. **IAM Policies**
   - Wildcards "*" are not allowed
   - Roles must follow least-privilege
   - Inline policies must be justified

3. **KMS Keys**
   - Required for all sensitive data layers
   - Key rotation must be enabled

4. **Lambda Functions**
   - Must attach CloudWatch logging policy
   - Must include restricted invocation roles

5. **API Gateway**
   - Must enforce private or limited-access stages
   - Must restrict unauthorized invoke actions
