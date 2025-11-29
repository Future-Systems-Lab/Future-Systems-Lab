<!-- Rights Reserved, Unlicensed -->

# 🔐 Security & Privacy Layer  
The Security & Privacy Layer enforces compliance, consent boundaries, encryption, auditability, and pseudonymized data flows across the Future Systems Lab ecosystem.  
This layer ensures that all decentralized logic aligns with HIPAA, GDPR, and FDA expectations while maintaining a zero-trust architecture.

---

# 1.0 Purpose  
The Security & Privacy Layer protects:

- user consent states  
- wearable permissions  
- session hashes  
- device linkages  
- activity events  
- audit records  
- token reward logic  

All protections use **event-driven enforcement**, **pseudonymization**, and **blockchain-anchored auditability**—ensuring transparent and irreversible logs without storing PHI.

---

# 2.0 Core Principles  
- **Zero-PHI architecture**: no PHI is ever written on-chain or stored in the database.  
- **Data minimization**: only pseudonymous signals (hashes, IDs, metrics) are processed.  
- **User-controlled consent**: fine-grained toggles dictate what data flows are allowed.  
- **Immutable auditing**: all actions produce tamper-proof logs via `ComplianceLog`.  
- **Separation of layers**: consent → session → reward → analytics are all isolated.  
- **Revocation-first design**: GDPR-style reversibility without data deletion risks.  
- **Zero-trust end-to-end**: assume every component is untrusted unless proven otherwise.  

---

# 3.0 Relevant On-Chain Contracts  
All verification links use **Blockscout** (canonical explorer).

| Contract          | Address | Purpose |
|------------------|---------|---------|
| **ConsentPolicy** | https://eth-sepolia.blockscout.com/address/0x75DbA8924AA975Ea0Da46989D1348BC756fF1c4E | Global consent registry |
| **NeuroBalanceConsent** | https://eth-sepolia.blockscout.com/address/0x59bF3605e1e62867Ad880eb5451789290F56E369 | Wearables + app-level permissions |
| **UserActivity** | https://eth-sepolia.blockscout.com/address/0x2cc949E7C4e8Ab0ec4F35dAf251D5c2C8a2bA848 | Device-linked activity events |
| **ComplianceLog** | https://eth-sepolia.blockscout.com/address/0xb169383145070fbC19EF972569E6ec35B253a69F | Immutable audit ledger |

---

# 4.0 Security Flow (High-Level)


flowchart TD
    U[User Wallet] --> CP[ConsentPolicy]
    U --> NBC[NeuroBalanceConsent]
    D[Wearable Device] --> NBC
    APP[Mobile / Watch App] --> UA[UserActivity]

    CP --> CL[ComplianceLog]
    NBC --> CL
    UA --> CL

    CL --> SEC[Security Layer Analytics]

5.0 Threat Model

This layer protects against:

Unauthorized data use (revoked consent, stale permissions)

Cross-device spoofing (fake sensors, replayed activity logs)

Session tampering (altered recommendations or timestamps)

Reward fraud (fake interactions to earn tokens)

Unauthorized access (untrusted apps or compromised devices)

Insecure storage (prevent PHI exposure)

Protection mechanisms include:

ECDSA/EIP-712 typed signatures

Device-specific linking

On-chain event validation

Pseudonymized IDs

Hash anchoring (SHA-256)

Session replay protection

Contract-based allowlists

6.0 Consent Logic
6.1 Fine-Grained Structure

Consent is broken into:

Wearable Sensors (HR, HRV, sleep, motion, mood)

Session Use (AI generation, hashing, protocol selection)

Activity Tracking (session events, device-linked logs)

Reward Eligibility (token earnings)

6.2 Revocation

Revocation triggers:

Freeze of future activity recordings

Immediate stop of wearable data ingestion

Denial of token issuance

Log entry in ComplianceLog

Update to SQL metadata for analytics blocking

This ensures GDPR Art.7 compliance without requiring deletion of audit artifacts.

7.0 Auditability

Every action produces an immutable record:

Event	Source	SQL Target	Purpose
ConsentUpdated	ConsentPolicy	Users metadata	Legal consent mapping
DeviceLinked	UserActivity	Devices	Device identity verification
ActivityLogged	UserActivity	UserActivityRelational	Behavioral analytics
SessionLogged	SessionStore	Sessions	Session integrity verification
TokenMinted	WellnessToken	Tokens	Reward accounting
ComplianceEntry	ComplianceLog	All tables via TxHash	Full audit ledger
8.0 Regulatory Alignment
Standard	Mapping
HIPAA 164.312	Access control via wallet signatures and contract roles
HIPAA 164.508	On-chain consent gating (ConsentPolicy.sol)
GDPR Art.6	Lawful basis through explicit, user-driven consent
GDPR Art.7	Full revocation support, event-based
GDPR Art.25	Privacy by design, zero-PHI
FDA 21 CFR Part 11	Timestamped records, tamper-evident logs
9.0 Verification Links

Contract Source Files (local)

contracts/ConsentPolicy.sol

contracts/NeuroBalanceConsent.sol

contracts/UserActivity.sol

contracts/ComplianceLog.sol

On-Chain Verification (Blockscout)

ConsentPolicy — https://eth-sepolia.blockscout.com/address/0x75DbA8924AA975Ea0Da46989D1348BC756fF1c4E

NeuroBalanceConsent — https://eth-sepolia.blockscout.com/address/0x59bF3605e1e62867Ad880eb5451789290F56E369

UserActivity — https://eth-sepolia.blockscout.com/address/0x2cc949E7C4e8Ab0ec4F35dAf251D5c2C8a2bA848

ComplianceLog — https://eth-sepolia.blockscout.com/address/0xb169383145070fbC19EF972569E6ec35B253a69F

Diagram Files

architecture/diagrams/security-privacy-layer.png

10.0 Summary

The Security & Privacy Layer enforces a zero-trust, zero-PHI, revocation-first design that ensures transparent, legally aligned, and tamper-proof system integrity across all devices, sessions, and protocols. It protects all consent flows, verifies all device actions, and ensures that every interaction is mapped to a verifiable, immutable audit trail.
