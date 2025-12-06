// Rights Reserved, Unlicensed

# 🔐 EncryptHealth — System Architecture

EncryptHealth is a decentralized, multi-layer digital health platform that unifies:

- identity
- consent
- AI-derived session signals
- governance
- verifiable event trails
- cross-layer analytics

The architecture spans Web3, clinical data patterns, wearables, and governance-grade policy controls.

---

# ⚙️ Layer 1 — Blockchain Layer

**Purpose:**
Anchor session events, consent decisions, and analytic outputs on-chain for auditability and reproducibility.

**Components:**
- ERC-20 Token Layer
- NFT Credential Layer
- SessionStore Contract
- ConsentPolicy Contract
- NeuroBalanceConsent Contract
- WellnessToken + ComplianceLog

**Functions:**
- Write session hashes
- Record practitioner attestations
- Enforce consent logic
- Emit analytics events
- Drive tokenized governance incentives

Diagrams located in `full_system_architecture.png` and `blockchain_layer.png`.

---

# 🛡️ Layer 2 — Security & Privacy Layer

**Purpose:**
Provide Zero-Trust governance controls, encryption boundaries, and API-level restrictions.

**Controls:**
- KMS encryption boundaries
- IAM least-privilege assignments
- Restricted API Gateway invoke roles
- Token-bound session validation
- OPA/Rego policy enforcement (audit-only)
- Terraform-enforced module restrictions

This guarantees tamper-evident, reproducible governance controls for all data flows.

---

# ⌚ Layer 3 — Wearables & Sensor Layer

**Purpose:**
Collect biometric, behavioral, and psychophysiological indicators from consumer-grade or clinical sensors.

**Examples:**
- HRV
- motion/gesture patterns
- cognitive load indicators
- orthomolecular wellness markers
- HypnoNeuro real-time interaction signals

Data moves through:

Sensor → Local Adapter → AI Scoring → Consent Logic → On-Chain Event

Diagram stored as `wearables_and_sensor_layer.png`.

---

# 🧩 Layer 4 — Full System Diagram

This diagram provides the cross-layer view:

User
→ Sensor Input
→ AI Scoring
→ Consent / Policy Enforcement
→ Blockchain Event
→ Governance & Analytics
→ Recruiter-Facing and Auditor-Facing Documentation

Stored as:

- `full_system_architecture.mmd`
- `full_system_architecture.png`

---

# 🔍 Verification & Reproducibility

## Smart Contract Verification
Contracts are verifiable on Blockscout with ABI, bytecode match, deployer metadata, and constructor parameters.

## SQL Schema Reproducibility
All schemas are version-controlled SQL files with deterministic structure definitions.

## Mermaid + PNG Diagram Reproducibility
Every diagram has:
- `.mmd` source
- `.png` export

## Reproducible Data Flows
Session → Consent → Tokenization → Governance pathways match across all diagrams and contract logs.

## On-Chain Session Verification Steps
1. Generate session hash
2. Submit to SessionStore
3. Retrieve Blockscout TX
4. Confirm stored event
5. Validate lifecycle

## Governance Verification
Includes:
- Pre-commit hooks
- CI lint/format/security checks
- OPA/Rego evaluation
- Terraform-controlled resources

---

# 🏛️ Governance Layer Overview

EncryptHealth implements a reproducible, auditable governance model:

- **Terraform IaC:** S3, KMS, IAM, CloudWatch, Lambda, API Gateway
- **Policy-as-Code:** OPA/Rego deny rules and audit-only enforcement
- **CI Gatekeeping:** lint, format, security, policy evaluation
- **Documentation Governance:** MkDocs index + architecture diagrams
- **Blockchain Governance:** token incentives + event-driven milestones

The governance layer ensures that developers, auditors, and external evaluators see the same unified control surface.

---

# 📁 Directory Index

- `blockchain_layer.mmd`
- `security_privacy_layer.mmd`
- `wearables_and_sensor_layer.mmd`
- `full_system_architecture.mmd`
- `*.png` diagram exports
- `sql/` schemas
- `governance/` Terraform + policy files (pending)

---

# 📘 End of File
