cd ~
cd ~/Future-Systems-Lab/architecture

cat > Blockchain-Layer.md << 'EOF'
<!-- Rights Reserved, Unlicensed -->

# 🏛️ Blockchain Architecture Layer  
This layer defines the decentralized logic, governance constraints, auditability, and cross-contract interoperability across the Future Systems Lab ecosystem.

---

# 1.0 Overview  
The blockchain layer coordinates consent, activity logging, session hashing, and tokenomics across the ecosystem.  
Each contract is verified on Sepolia and designed for transparent, observable behavior.

---

# 2.0 Verified Smart Contracts (Updated)

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


# 5.0 Tokenomics Model

## 5.1 Issuance Logic  
The reward system follows a fixed-issuance model designed to reinforce user engagement, biochemical milestones, and governance participation.

### **HNT — HypnoNeuro Engagement Token**
- **L1 Session Completion:** +3 HNT  
- **L2 Biochemical Milestone:** +3 HNT  
- **L3 Narrative Integration:** +3 HNT  

HNT reinforces progression through the L1–L3 modular framework (induction → biochemical logic → narrative integration).

### **EHT — EncryptHealth Governance Token**
- **Governance Actions:** +EHT minted for completing approved EncryptHealth governance or compliance tasks (consent updates, audit interactions, DAO-aligned tasks).

EHT reinforces data-governance behaviors and transparent system operations.

---

## 5.2 Burn Logic  
Users may burn tokens to:
- Unlock progression gates  
- Redeem protocol-governed discounts  
- Signal commitment to long-term engagement  

---

## 5.3 Treasury  
A future multi-sig–controlled treasury will manage:
- Reward pool refills  
- Governance allocation cycles  
- Stakeholder distributions  

All token flows remain fully transparent and traceable through on-chain events.

---

# 6.0 Audit & Security

## 6.1 Static Analysis  
- Slither scan  
- Mythril symbolic execution  
- Echidna fuzz testing (in progress)

## 6.2 Audit Artifacts  
- Stored in: `/architecture/audits/` (planned)

## 6.3 Event-Based Audit Trail  
Every major action emits:
- `ConsentUpdated`
- `TokenMinted`
- `SessionLogged`
- `NFTUnlocked`

This creates a permanent, queryable audit ledger.


# 7.0 Compliance Mapping  
This section connects with the Security & Privacy layer:

| Requirement        | Control           | Location               |
| ------------------ | ----------------- | ---------------------- |
| HIPAA 164.508      | Consent gating    | ConsentPolicy.sol      |
| HIPAA 164.312      | Audit controls    | ComplianceLog          |
| GDPR Art.7         | Revocation        | ConsentPolicy.sol      |
| GDPR Art.25        | Privacy by design | Hash-only architecture |
| FDA 21 CFR Part 11 | Event signatures  | Blockchain timestamps  |



# 8.0 Summary  
The Blockchain Architecture Layer defines the decentralized foundation for identity-linked consent, reward mechanisms, transparent governance, and system-wide data integrity, forming the connective layer of the Future Systems Lab ecosystem.

