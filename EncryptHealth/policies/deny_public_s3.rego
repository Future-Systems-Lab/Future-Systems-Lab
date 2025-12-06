# rego v1

package encrypthealth.policy

deny[msg] if {
    input.resource_type == "aws_s3_bucket"
    input.public == true
    msg := "Public S3 buckets are not permitted."
}
