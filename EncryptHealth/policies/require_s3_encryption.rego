# rego v1

package encrypthealth.policy

deny[msg] if {
    input.resource_type == "aws_s3_bucket"
    not input.encrypted
    msg := "S3 buckets must enforce server-side encryption."
}
