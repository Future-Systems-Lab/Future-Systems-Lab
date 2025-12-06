// Rights Reserved, Unlicensed

terraform {
  required_version = ">= 1.6.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "s3_private" {
  source = "./modules/s3_private"
}

module "kms_main" {
  source = "./modules/kms_main"
}

module "iam_roles" {
  source = "./modules/iam_roles"
}

module "cloudwatch_logs" {
  source = "./modules/cloudwatch_logs"
}

module "lambda_api" {
  source = "./modules/lambda_api"
}
