// Rights Reserved, Unlicensed

output "master_key_arn" {
  value = aws_kms_key.master.arn
}

output "s3_key_arn" {
  value = aws_kms_key.s3.arn
}

output "lambda_key_arn" {
  value = aws_kms_key.lambda.arn
}
