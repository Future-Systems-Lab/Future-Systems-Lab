// Rights Reserved, Unlicensed

# 🧭 EncryptHealth — Documentation Index

This is the authoritative index for the EncryptHealth platform.
It connects every architectural layer, governance component, Terraform module, and verification artifact into one reproducible navigational structure.

---

# 🔐 1. Architecture Layers

## Blockchain Layer
Location: `architecture/README.md`
Artifacts:
- `blockchain_layer.mmd`
- `blockchain_layer.png`
- Smart contract verification links (Blockscout)
- Event models & token logic

## Security & Privacy Layer
Location: `architecture/README.md`
Artifacts:
- IAM controls
- KMS encryption boundaries
- API Gateway protections
- Rego deny rules

## Wearables & Sensor Layer
Location: `architecture/README.md`
Artifacts:
- `wearables_and_sensor_layer.mmd`
- `wearables_and_sensor_layer.png`

## Full System Diagram
Location: `architecture/full_system_architecture.*`
Artifacts:
- `.mmd` Mermaid source
- `.png` rendered diagram

---

# 🧪 2. Verification & Reproducibility

This section explains exactly how to reproduce EncryptHealth’s blockchain, data, infrastructure, and documentation outputs.

## 2.1 Session Hash Reproduction
1. Open `send_session.py` in `~/Future-Systems-Lab/session/`
2. The session string is currently:

3. Running the script generates the SHA-256 hash:
ed858838e831c432e27ab06b160e699f963d42313f31411d4150f8e5695778904. This value can be reproduced by any SHA-256 tool using the same input string.

## 2.2 On-Chain Transaction Reproduction
1. The real TX hash is:
0x644ce86ef1ee6f0fac1ba4bdc2919de17a690e4be19a87178151d0f201ea76f82. Verified on Blockscout:
https://eth-sepolia.blockscout.com/tx/644ce86ef1ee6f0fac1ba4bdc2919de17a690e4be19a87178151d0f201ea76f8
3. Deployer address:
0x9051bb172F9A5a9e8FdF99A17D33BA426a6a01014. RPC endpoint used for reproduction:
https://eth-sepolia.g.alchemy.com/v2/demo
## 2.3 Contract Source Verification
Smart contract:
0x3Be8285F089cb53ed811CF0d8c79c19D8245db09Fully verified via Sourcify + Blockscout.

Reproduction steps:
- Compile contract using Solidity v0.8.30
- Match bytecode
- Upload metadata for automated verification.

## 2.4 Terraform Reproducibility
All infrastructure is rebuildable from:

~/Future-Systems-Lab/terraform
Terraform modules include:
- KMS
- S3 private buckets
- IAM roles
- Lambda & API Gateway modules
- CloudWatch logs

Execution:
terraform init
terraform plan
terraform apply
## 2.5 Governance Reproducibility
Governance components are fully reproducible from:

~/Future-Systems-Lab/governance
Includes:
- Rego deny rules
- Pre-commit enforcement
- CI policy checks
- Terraform policy-as-code
- Documentation governance

## 2.6 Diagram Reproduction
All Mermaid diagrams are stored in `.mmd` format and rendered to PNG via:

mmdc -i diagram.mmd -o diagram.png
## 2.7 Documentation Reproduction
Documentation served from MkDocs + Material theme using:

mkdocs serve
mkdocs build
Output site deploys to GitHub Pages from `gh-pages` branch.

---

# 🧱 3. Terraform Infrastructure (IaC)

Terraform root:
`~/Future-Systems-Lab/terraform`

Modules:
- `modules/s3_private`
- `modules/kms_main`
- `modules/iam_roles`
- `modules/cloudwatch_logs`
- `modules/lambda_api`

Root entrypoint:
`terraform/main.tf`

---

# 🔑 4. AWS ARN Registry

Location:
`~/Future-Systems-Lab/aws_arns/arns.tf`

Includes ARNs for:
- S3
- KMS
- Lambda
- API Gateway
- CloudWatch
- IAM roles/policies

---

# 🏛️ 5. Governance Layer

Directory:
`~/Future-Systems-Lab/governance`

Contents:
- `overview.md`
- `policies/rego/deny.rego`
- `policies/terraform/README.md`
- `ci/README.md`
- `precommit/.pre-commit-config.yaml`

---

# 📁 6. Diagrams

All diagrams located in:
`~/Future-Systems-Lab/architecture/`

---

# 🗄️ 7. SQL Schemas

Directory (to be completed):
`~/Future-Systems-Lab/sql/`

---

# 🌐 8. MkDocs Site

Documentation framework files:
- `mkdocs.yml`
- `docs/` directory
- GitHub Pages deploy workflow

---

# 📘 End of File
