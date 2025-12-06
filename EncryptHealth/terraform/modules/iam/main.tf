// Rights Reserved, Unlicensed

resource "aws_iam_role" "lambda_role" {
  name = "encrypthlth-lambda-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Service = "lambda.amazonaws.com"
      },
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role" "apigw_role" {
  name = "encrypthlth-apigateway-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Service = "apigateway.amazonaws.com"
      },
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_policy" "lambda_policy" {
  name = "encrypthlth-lambda-policy"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid    = "CloudWatchLogs",
        Effect = "Allow",
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Resource = "*"
      },
      {
        Sid    = "S3Access",
        Effect = "Allow",
        Action = [
          "s3:GetObject",
          "s3:PutObject"
        ],
        Resource = [
          "arn:aws:s3:::encrypthlth-coa-files/*"
        ]
      },
      {
        Sid    = "DynamoAccess",
        Effect = "Allow",
        Action = [
          "dynamodb:PutItem",
          "dynamodb:UpdateItem"
        ],
        Resource = [
          "arn:aws:dynamodb:us-east-1:000000000000:table/encrypthlth-session-store",
          "arn:aws:dynamodb:us-east-1:000000000000:table/encrypthlth-consent-store"
        ]
      },
      {
        Sid    = "KMSDecrypt",
        Effect = "Allow",
        Action = [
          "kms:Decrypt"
        ],
        Resource = [
          var.kms_key_id
        ]
      }
    ]
  })
}

resource "aws_iam_policy" "apigw_policy" {
  name = "encrypthlth-apigateway-policy"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid    = "InvokeLambda",
        Effect = "Allow",
        Action = [
          "lambda:InvokeFunction"
        ],
        Resource = [
          var.lambda_function_arn
        ]
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_attach" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.lambda_policy.arn
}

resource "aws_iam_role_policy_attachment" "apigw_attach" {
  role       = aws_iam_role.apigw_role.name
  policy_arn = aws_iam_policy.apigw_policy.arn
}
