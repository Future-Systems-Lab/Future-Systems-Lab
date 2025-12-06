<!-- Rights Reserved, Unlicensed -->

<p align="center">
  <img src="../assets/future-systems-lab-header.png" width="1000">
</p>

# 🧩 Full System Architecture
Future Systems Lab integrates blockchain, wearables, consent, analytics, and wellness protocols into a unified digital-health ecosystem.
This document provides the end-to-end architecture for recruiters, engineers, researchers, and academic reviewers.

---

# **1.0 High-Level Overview**

The ecosystem consists of four interoperable layers:

1. **Blockchain Layer**
   Smart contracts for consent, sessions, rewards, device identity, and compliance logging.

2. **Security & Privacy Layer**
   Zero-trust, zero-PHI, revocation-first model enforcing auditability and legal compliance.

3. **Wearables & Sensor Layer**
   NeuroBalance Watch + other sensory devices providing structured, pseudonymized telemetry.

4. **Data & Analytics Layer**
   PostgreSQL + SQL models mirroring on-chain events for dashboards, queries, and system intelligence.

---

# **2.0 Full System Diagram (Mermaid)**

```mermaid
flowchart TD
    subgraph USER[User]
        W[Watch / Wearable]
        APP[Mobile App]
        WALLET[Web3 Wallet]
    end

    subgraph CHAIN[Blockchain Layer]
        CP[ConsentPolicy]
        NBC[NeuroBalanceConsent]
        SS[EncryptHealthSessionStore]
        UA[UserActivity]
        WT[WellnessToken]
        CL[ComplianceLog]
    end

    subgraph DATA[Data & Analytics Layer]
        DB[(PostgreSQL)]
        SQL[SQL Models]
        ANALYTICS[Dashboards / Metrics]
    end

    subgraph SEC[Security & Privacy Layer]
        ENF[Enforcement Rules]
        THREAT[Threat Protections]
        AUDIT[Audit Validation]
    end

    %% Device Flow
    W --> NBC
    W --> UA
    APP --> UA

    %% User Wallet Interactions
    WALLET --> CP
    WALLET --> NBC

    %% On-Chain Outputs
    CP --> CL
    NBC --> CL
    UA --> CL

    %% Rewards
    UA --> WT

    %% Data Layer
    CL --> DB
    UA --> DB
    SS --> DB

    DB --> SQL --> ANALYTICS

    %% Security Layer Hooks
    CP --> ENF
    NBC --> ENF
    UA --> ENF
    CL --> AUDIT
    ENF --> THREAT

3.0 Contract Addresses (Sepolia)
| Contract                  | Address                                    |
| ------------------------- | ------------------------------------------ |
| ConsentPolicy             | 0x75DbA8924AA975Ea0Da46989D1348BC756fF1c4E |
| NeuroBalanceConsent       | 0x59bF3605e1e62867Ad880eb5451789290F56E369 |
| UserActivity              | 0x2cc949E7C4e8Ab0ec4F35dAf251D5c2C8a2bA848 |
| WellnessToken             | 0x18d7C8186dA31a0DF3a4D3EEB96e8cEb70c09DDC |
| ComplianceLog             | 0xb169383145070fbC19EF972569E6ec35B253a69F |
| EncryptHealthSessionStore | 0x3Be8285F089cb53ed811CF0d8c79c19D8245db09 |
4.0 End-to-End Flow Summary

User signs consent → stored in ConsentPolicy

Device actions pass through NeuroBalanceConsent

Sessions + sensor metadata → UserActivity

All interactions emit ComplianceLog

Valid interactions → WellnessToken rewards

All on-chain events mirrored into PostgreSQL

SQL transforms create analytics dashboards

Security Layer continuously enforces revocation, integrity, anti-fraud
5.0 Verification & Reproducibility
Verify Smart Contracts

Use Blockscout links above (default explorer for FSL).

Reproduce SQL Models

Location: /architecture/Data-Layer.md

Validate Mermaid diagrams

Compatible with GitHub rendering.

Validate Wearables Model

Location: /architecture/Wearables-Sensor-Layer.md
6.0 Summary

The full architecture integrates consent, identity, devices, rewards, and analytics into a single verifiable chain of trust.
This diagram is the top-level blueprint for all future partners, auditors, and researchers.


---

## 🔗 Architecture Layer References

### Blockchain Layer
https://github.com/Future-Systems-Lab/Future-Systems-Lab/blob/main/architecture/Blockchain-Layer.md

### Security & Privacy Layer
https://github.com/Future-Systems-Lab/Future-Systems-Lab/blob/main/architecture/Security-Privacy-Layer.md

### Wearables & Sensor Layer
https://github.com/Future-Systems-Lab/Future-Systems-Lab/blob/main/architecture/Wearables-Sensor-Layer.md

### Data Layer
https://github.com/Future-Systems-Lab/Future-Systems-Lab/blob/main/architecture/Data-Layer.md

### System Diagram (PNG)
https://github.com/Future-Systems-Lab/Future-Systems-Lab/blob/main/architecture/diagrams/full-system-architecture.png

### Architecture Directory Root
https://github.com/Future-Systems-Lab/Future-Systems-Lab/tree/main/architecture
