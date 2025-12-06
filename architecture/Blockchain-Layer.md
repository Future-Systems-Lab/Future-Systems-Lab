<!-- Rights Reserved, Unlicensed -->

# 🏛️ Blockchain Architecture Layer

# 1.0 Overview
The blockchain layer coordinates consent, activity logging, session hashing, and tokenomics across the ecosystem.

---

# 2.0 Verified Smart Contracts (Blockscout Only)

## 2.1 Core Governance + Compliance

### **ComplianceLog**
- **Address:** [`0xb169383145070fbC19EF972569E6ec35B253a69F`](https://eth-sepolia.blockscout.com/address/0xb169383145070fbC19EF972569E6ec35B253a69F)

### **ConsentPolicy**
- **Address:** [`0x75DbA8924AA975Ea0Da46989D1348BC756fF1c4E`](https://eth-sepolia.blockscout.com/address/0x75DbA8924AA975Ea0Da46989D1348BC756fF1c4E)

---

## 2.2 Session Hashing + Analytics Anchoring

### **EncryptHealthSessionStore**
- **Address:** [`0x3Be8285F089cb53ed811CF0d8c79c19D8245db09`](https://eth-sepolia.blockscout.com/address/0x3Be8285F089cb53ed811CF0d8c79c19D8245db09)

---

## 2.3 Wearable + App-Level Consent

### **NeuroBalanceConsent**
- **Address:** [`0x59bF3605e1e62867Ad880eb5451789290F56E369`](https://eth-sepolia.blockscout.com/address/0x59bF3605e1e62867Ad880eb5451789290F56E369)

---

## 2.4 Activity Tracking

### **UserActivity**
- **Address:** [`0x2cc949E7C4e8Ab0ec4F35dAf251D5c2C8a2bA848`](https://eth-sepolia.blockscout.com/address/0x2cc949E7C4e8Ab0ec4F35dAf251D5c2C8a2bA848)

---

## 2.5 Tokenomics Layer

### **WellnessToken (ERC-20)**
- **Address:** [`0x18d7C8186dA31a0DF3a4D3EEB96e8cEb70c09DDC`](https://eth-sepolia.blockscout.com/address/0x18d7C8186dA31a0DF3a4D3EEB96e8cEb70c09DDC)

---

# 3.0 Inter-Contract Architecture

flowchart TD

    U[User Wallet] --> S[EncryptHealthSessionStore]
    U --> C1[ConsentPolicy]
    U --> C2[NeuroBalanceConsent]
    U --> A[UserActivity]
    U --> T[WellnessToken]

    C1 --> L[ComplianceLog]
    C2 --> L
    A --> L
    S --> L

    T --> R[Incentive Layer]

### Contract Addresses Used in Diagram

| Contract                  | Address                                                                                                                               |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------------------------- |
| EncryptHealthSessionStore | [`0x3Be8285F089cb53ed811CF0d8c79c19D8245db09`](https://eth-sepolia.blockscout.com/address/0x3Be8285F089cb53ed811CF0d8c79c19D8245db09) |
| ConsentPolicy             | [`0x75DbA8924AA975Ea0Da46989D1348BC756fF1c4E`](https://eth-sepolia.blockscout.com/address/0x75DbA8924AA975Ea0Da46989D1348BC756fF1c4E) |
| NeuroBalanceConsent       | [`0x59bF3605e1e62867Ad880eb5451789290F56E369`](https://eth-sepolia.blockscout.com/address/0x59bF3605e1e62867Ad880eb5451789290F56E369) |
| UserActivity              | [`0x2cc949E7C4e8Ab0ec4F35dAf251D5c2C8a2bA848`](https://eth-sepolia.blockscout.com/address/0x2cc949E7C4e8Ab0ec4F35dAf251D5c2C8a2bA848) |
| WellnessToken             | [`0x18d7C8186dA31a0DF3a4D3EEB96e8cEb70c09DDC`](https://eth-sepolia.blockscout.com/address/0x18d7C8186dA31a0DF3a4D3EEB96e8cEb70c09DDC) |
| ComplianceLog             | [`0xb169383145070fbC19EF972569E6ec35B253a69F`](https://eth-sepolia.blockscout.com/address/0xb169383145070fbC19EF972569E6ec35B253a69F) |

---

# 4.0 Inter-Contract Architecture

The ecosystem functions through **event-driven interoperability**:

### 4.1 Contract Mapping for the Flow

| Stage                       | Contract | Blockscout Link |
|-----------------------------|----------|-----------------|
| Session Recorded            | UserActivity | https://eth-sepolia.blockscout.com/address/0x2cc949E7C4e8Ab0ec4F35dAf251D5c2C8a2bA848 |
| Permission Check            | ConsentPolicy | https://eth-sepolia.blockscout.com/address/0x75DbA8924AA975Ea0Da46989D1348BC756fF1c4E |
| Reward Token Mint           | WellnessToken | https://eth-sepolia.blockscout.com/address/0x18d7C8186dA31a0DF3a4D3EEB96e8cEb70c09DDC |
| NFT Tier Unlock (future)    | MindMasteryNFT | https://eth-sepolia.blockscout.com/address/0xCb9EcB00574DB29976c7C54045d443666D5C7771 |
| Compliance Event Emission   | ComplianceLog | https://eth-sepolia.blockscout.com/address/0xb169383145070fbC19EF972569E6ec35B253a69F |

---

# 5.0 Tokenomics Model

## 5.1 Issuance Logic

### **HNT — HypnoNeuro Engagement Token**
- L1 Session Completion: +3 HNT  
- L2 Biochemical Milestone: +3 HNT  
- L3 Narrative Integration: +3 HNT  

### **EHT — EncryptHealth Governance Token**
- Minted for governance and compliance tasks.

---

## 5.2 Burn Logic  
Users burn tokens for:
- Progression  
- Discounts  
- Commitment signaling  

---

## 5.3 Treasury  
Managed by future multi-sig.

---

# 6.0 Audit & Security

## 6.1 Static Analysis  
Slither, Mythril, Echidna.

## 6.2 Artifacts  
Stored under `/architecture/audits/`.

## 6.3 Event Audit Trail  
ConsentUpdated, TokenMinted, SessionLogged, NFTUnlocked.

---

# 7.0 Compliance Mapping

| Requirement        | Control           | Location               |
| ------------------ | ----------------- | ---------------------- |
| HIPAA 164.508      | Consent gating    | ConsentPolicy.sol      |
| HIPAA 164.312      | Audit controls    | ComplianceLog          |
| GDPR Art.7         | Revocation        | ConsentPolicy.sol      |
| GDPR Art.25        | Privacy by design | Hash-only architecture |
| FDA 21 CFR Part 11 | Event signatures  | Blockchain timestamps  |

---

# 8.0 Summary  
The Blockchain Architecture Layer defines the decentralized foundation for consent, rewards, governance, and system-wide data integrity.

