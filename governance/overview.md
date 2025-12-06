// Rights Reserved, Unlicensed

# Governance Overview

EncryptHealth applies a reproducible, multi-layer governance model to ensure transparency, auditability, and deterministic infrastructure behavior.

Governance controls span:

- Terraform Infrastructure-as-Code
- OPA/Rego policy evaluation (audit-only)
- CI enforcement (lint, format, security, policy)
- Pre-commit checks
- AWS IAM least-privilege
- Encryption boundaries via KMS
- Documentation governance through MkDocs

These controls guarantee that developers, auditors, and external evaluators all observe the same system behavior and infrastructure state.
