<!-- Rights Reserved, Unlicensed -->

# 🏗️ Full System Architecture
This document unifies the **Wearables Layer**, **App Layer**, **Data Layer**, and **Blockchain Layer** into one complete end-to-end architecture for the Future Systems Lab ecosystem.

---

# 1.0 Overview
The system operates as a **modular, decentralized digital-health stack**:

- Wearables capture signals and consented metrics
- Apps process sensations, sessions, micro-protocols
- Data Layer stores pseudonymized records
- Blockchain Layer anchors the final state (hashes, tokens, consent, compliance)
- ComplianceLog creates a universal immutable audit trail

---

# 2.0 High-Level Diagram (PNG Placeholder)

<p align="center">
  <img src="./diagrams/full-system-architecture.png" width="900" alt="Full System Architecture Diagram">
</p>

*A polished PNG can be added here when ready.*

---

# 3.0 Mermaid System Diagram (Source)

```mermaid
flowchart TD

    %% Wearables Layer
    W1[NeuroBalance Watch] --> A1
    W2[InstaPsych App Inputs] --> A1

    %% App Layer
    A1[App Logic / Sensation Mapping] --> D1
    A1 --> D2
    A1 --> BC1

    %% Data Layer
    D1[(Sessions Table)]
    D2[(Sensor Data)]
    D3[(UserActivityRelational)]
    D4[(Tokens Mirror)]

    D1 --> BC2
    D2 --> BC2
    D3 --> BC2
    D4 --> BC2

    %% Blockchain Layer
    BC1[ConsentPolicy.sol]
    BC2[EncryptHealthSessionStore.sol]
    BC3[NeuroBalanceConsent.sol]
    BC4[UserActivity.sol]
    BC5[WellnessToken.sol]
    BC6[ComplianceLog.sol]

    %% Unified Audit Trail
    BC1 --> BC6
    BC2 --> BC6
    BC3 --> BC6
    BC4 --> BC6
    BC5 --> BC6

4.0 Component Roles
4.1 Wearables Layer

NeuroBalance Watch (HR, motion, mood cues)

Consent-controlled data streaming

Micro-protocol triggers

4.2 App Layer

Sensation → protocol matching

Session-generation and hashing

Handles L1/L2/L3 progression logic

Optional DID/VC identity

4.3 Data Layer

Pseudonymized structured storage

Maps all blockchain events into analytics

Never stores PHI

Mirrors token events and session hashes

4.4 Blockchain Layer

Verified contracts (Blockscout):

Contract	Address
ConsentPolicy	https://eth-sepolia.blockscout.com/address/0x75DbA8924AA975Ea0Da46989D1348BC756fF1c4E

NeuroBalanceConsent	https://eth-sepolia.blockscout.com/address/0x59bF3605e1e62867Ad880eb5451789290F56E369

UserActivity	https://eth-sepolia.blockscout.com/address/0x2cc949E7C4e8Ab0ec4F35dAf251D5c2C8a2bA848

WellnessToken	https://eth-sepolia.blockscout.com/address/0x18d7C8186dA31a0DF3a4D3EEB96e8cEb70c09DDC

ComplianceLog	https://eth-sepolia.blockscout.com/address/0xb169383145070fbC19EF972569E6ec35B253a69F

EncryptHealthSessionStore	https://eth-sepolia.blockscout.com/address/0x3Be8285F089cb53ed811CF0d8c79c19D8245db09

Blockchain functions:

Consent gating

Session hashing

Activity logging

Token issuance

Global audit trail

5.0 End-to-End Flow

Wearable or app produces a signal or session.

App hashes and stores session metadata locally.

Hash anchors to EncryptHealthSessionStore.

ConsentPolicy + NeuroBalanceConsent ensure permissions.

UserActivity logs device + protocol events.

Valid actions mint WellnessToken or HNT/EHT.

ComplianceLog records the final tamper-proof event.

Data Layer syncs all blockchain events to SQL for analytics.

6.0 Verification & Reproducibility
6.1 Contract Verification

All contracts are publicly verified on Blockscout (canonical explorer).

6.2 Diagram Reproduction

PNG + Mermaid files are located in:
/architecture/diagrams/

6.3 Sync Testing

Local data can be validated by:

Checking emitted events

Hash-matching session records

Confirming token issuance rules

Reviewing audit timestamps

7.0 Summary

The full Future Systems Lab ecosystem is a closed-loop, consent-governed, analytics-driven digital-health architecture.

It unites wearable signals, session generation, reward logic, consent, compliance, and blockchain immutability into one coherent system.
