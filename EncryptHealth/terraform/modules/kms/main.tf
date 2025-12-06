// Rights Reserved, Unlicensed

resource "aws_kms_key" "master" {
  description             = "EncryptHealth master CMK"
  enable_key_rotation     = true
}

resource "aws_kms_alias" "master_alias" {
  name          = "alias/encrypthlth-master-cmk"
  target_key_id = aws_kms_key.master.key_id
}

resource "aws_kms_key" "s3" {
  description             = "EncryptHealth S3 CMK"
  enable_key_rotation     = true
}

resource "aws_kms_alias" "s3_alias" {
  name          = "alias/encrypthlth-s3-cmk"
  target_key_id = aws_kms_key.s3.key_id
}

resource "aws_kms_key" "lambda" {
  description             = "EncryptHealth Lambda CMK"
  enable_key_rotation     = true
}

resource "aws_kms_alias" "lambda_alias" {
  name          = "alias/encrypthlth-lambda-cmk"
  target_key_id = aws_kms_key.lambda.key_id
}
