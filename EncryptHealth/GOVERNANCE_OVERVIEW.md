// Rights Reserved, Unlicensed

# 🟧 EncryptHealth Governance Overview

EncryptHealth uses layered governance controls across infrastructure, code, policy, and blockchain components to ensure transparency, traceability, and reproducibility.

This file serves as the central governance reference for developers, auditors, and partners.

---

## 1. Policy-as-Code (OPA / Rego)

Open Policy Agent (OPA) evaluates governance rules against Terraform plans and CI pipelines.

Rego policies enforce:
- deny_public_s3
- deny_iam_wildcards
- require_s3_encryption
- require_kms_encryption
- audit tagging standards
- approved module usage

Example policies:
- `enforce_private_s3.rego`
- `deny_wildcard_actions.rego`
- `require_kms.rego`

OPA runs in “audit-only” mode for development and “enforce” for protected branches.

---

## 2. Pre-Commit Hooks

The development workflow uses pre-commit controls:
- terraform fmt
- terraform validate
- tflint
- tfsec
- detect-secrets
- large-file detector
- prettier
- markdown lint

These ensure consistent formatting, security scanning, and compliance integrity before code reaches CI.

---

## 3. CI/CD Governance Pipeline

GitHub Actions pipeline includes:
- Install Terraform + providers
- Lint + security scans
- OPA policy evaluation
- Terraform plan with governance checks
- Block unapproved actions
- Publish documentation artifacts

Protected branches require:
- signed commits
- successful checks
- passing OPA evaluation

---

## 4. Terraform Governance

Infrastructure is provisioned using Terraform with the following constraints:

- S3 buckets must use SSE-KMS
- IAM policies must restrict `Action` fields
- No `*` wildcards in policy documents
- CloudWatch logs required for all runtime resources
- Lambda + API Gateway must use least-privilege roles
- All infrastructure must reference ARNs in `AWS_ARN_COLLECTION.md`

Modules:
- networking
- storage
- compute
- access control
- audit

---

## 5. Security Controls

Core EncryptHealth controls include:
- S3 encryption (KMS CMK)
- IAM role separation
- CloudWatch audit trails
- Access logs retention requirements
- API Gateway throttling
- Strict KMS access boundaries

Logging must not store PHI.

---

## 6. Compliance Flow (OPA + Terraform + CI)

Process:
1. Developer edits Terraform
2. Pre-commit hooks validate structure
3. GitHub Actions runs security + policy checks
4. OPA evaluates Rego rules
5. Terraform plan is generated
6. Enforcement rules block non-compliant changes
7. Approved changes merge into protected branches

This ensures infrastructure remains governable and reproducible.

---
