// Rights Reserved, Unlicensed

# 🔐 EncryptHealth Architecture Index

This index links all architecture layers, diagrams, contracts, schemas, and governance components for the EncryptHealth platform.

---

## 1. Blockchain Layer
- ConsentPolicy
- NeuroBalanceConsent
- EncryptHealthSessionStore
- UserActivity
- WellnessToken
- ComplianceLog
- Verified contracts:
  - https://eth-sepolia.blockscout.com/address/0x3Be8285F089cb53ed811CF0d8c79c19D8245db09
  - https://eth-sepolia.blockscout.com/address/0x75DbA8924AA975Ea0Da46989D1348BC756fF1c4E
  - https://eth-sepolia.blockscout.com/address/0x59bF3605e1e62867Ad880eb5451789290F56E369
  - https://eth-sepolia.blockscout.com/address/0x2cc949E7C4e8Ab0ec4F35dAf251D5c2C8a2bA848
  - https://eth-sepolia.blockscout.com/address/0x18d7C8186dA31a0DF3a4D3EEB96e8cEb70c09DDC
  - https://eth-sepolia.blockscout.com/address/0xb169383145070fbC19EF972569E6ec35B253a69F

---

## 2. Security & Privacy Layer
- OPA/Rego governance checks
- IAM roles + least privilege
- S3 encrypted storage
- KMS CMK keys
- CloudWatch audit trails
- Policy-as-Code controls

---

## 3. Wearables & Sensor Layer
- NeuroBalance Watch consent mapping
- Sensor → API → Blockchain pipeline
- Seven missing UI consent toggles (on-chain fields exist)
- Data ingestion model

---

## 4. Full System Architecture
- End-to-end diagram (PNG + Mermaid)
- Links to all subsystem diagrams and verification steps
- Data lineage across blockchain, database, and APIs

---

## 5. Verification & Reproducibility
- How to verify contracts via Blockscout
- How to reproduce architecture diagrams
- SQL schema verification
- Folder index for partners and reviewers

---

## 6. Governance Overview
- Pre-commit hooks
- CI governance pipeline
- Terraform module restrictions
- REGO policy notes
- Infrastructure compliance flow

---
