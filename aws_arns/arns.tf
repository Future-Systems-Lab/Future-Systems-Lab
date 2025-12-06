// Rights Reserved, Unlicensed

# ============================================================
# EncryptHealth AWS ARN Registry
# Deterministic ARN templates for Terraform + Governance
# ============================================================

locals {

  # -----------------------------
  # S3 Buckets
  # -----------------------------
  s3_coa_bucket_arn        = "arn:aws:s3:::encrypthealth-coa-storage"
  s3_coa_bucket_objects_arn = "arn:aws:s3:::encrypthealth-coa-storage/*"

  # -----------------------------
  # KMS Keys
  # -----------------------------
  kms_main_key_arn   = "arn:aws:kms:us-east-1:123456789012:key/encrypthealth-main"
  kms_main_alias_arn = "arn:aws:kms:us-east-1:123456789012:alias/encrypthealth-main"

  # -----------------------------
  # Lambda Functions
  # -----------------------------
  lambda_api_arn = "arn:aws:lambda:us-east-1:123456789012:function:encrypthealth-api"

  # -----------------------------
  # API Gateway
  # -----------------------------
  apigw_api_arn     = "arn:aws:execute-api:us-east-1:123456789012:*"
  apigw_stage_arn   = "arn:aws:execute-api:us-east-1:123456789012:*/$default/*"

  # -----------------------------
  # CloudWatch Logs
  # -----------------------------
  cloudwatch_lambda_arn = "arn:aws:logs:us-east-1:123456789012:log-group:/aws/lambda/encrypthealth"

  # -----------------------------
  # IAM Roles / Policies
  # -----------------------------
  iam_lambda_exec_role_arn   = "arn:aws:iam::123456789012:role/encrypthealth-lambda-exec"
  iam_lambda_policy_arn      = "arn:aws:iam::123456789012:policy/encrypthealth-lambda-policy"
  iam_invoke_policy_arn      = "arn:aws:iam::123456789012:policy/encrypthealth-apigw-invoke"
  iam_kms_policy_arn         = "arn:aws:iam::123456789012:policy/encrypthealth-kms-access"
  iam_s3_policy_arn          = "arn:aws:iam::123456789012:policy/encrypthealth-s3-access"
  iam_dynamodb_policy_arn    = "arn:aws:iam::123456789012:policy/encrypthealth-dynamodb-access"
}
