# rego v1

package encrypthealth.policy

deny[msg] if {
    input.resource_type == "aws_iam_policy"
    some stmt
    stmt := input.statement[_]
    stmt.effect == "Allow"
    stmt.action == "*"
    msg := "IAM wildcard actions are not permitted."
}
