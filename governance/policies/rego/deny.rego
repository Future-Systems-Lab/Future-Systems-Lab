// Rights Reserved, Unlicensed

package encrypthealth.deny

# Deny public S3 buckets
deny[msg] {
  input.resource_type == "aws_s3_bucket"
  input.public == true
  msg = "Public S3 buckets are not permitted."
}

# Deny IAM wildcard permissions
deny[msg] {
  input.resource_type == "aws_iam_policy"
  input.action == "*"
  msg = "IAM wildcard actions are not permitted."
}

# Require KMS encryption for storage
deny[msg] {
  input.requires_encryption == true
  input.kms_enabled != true
  msg = "Required encryption is missing KMS."
}
