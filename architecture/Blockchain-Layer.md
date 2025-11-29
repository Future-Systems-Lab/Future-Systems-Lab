<!-- Rights Reserved, Unlicensed -->

# 🏛️ Blockchain Architecture Layer  
This layer defines the decentralized logic, governance constraints, auditability, and cross-contract interoperability across the Future Systems Lab ecosystem.

---

# 1.0 Overview  
The blockchain layer coordinates consent, activity logging, credential progression, and tokenomics across the ecosystem.  
Each contract is independently verified on Sepolia and designed for transparent and observable behavior with no hidden logic.

---

# 2.0 Verified Smart Contracts

## 2.1 ERC-20 Tokens
### EncryptHealthToken (EHT)  
- **Address:** `0xbDaeb1d05E02D2751Ad07121510b5f0C436E2CdC`  
- **Purpose:** Data-governance utility token; minted for compliant actions and milestones.  
- **Functions:** mint, burn, transfer, governance-controlled supply.

### HypnoNeuroToken (HNT)  
- **Address:** `0x411426f8E735F7940B20491609F08817A805b198`  
- **Purpose:** Engagement-based reward token; ties to progression milestones in L1–L3.  

---

## 2.2 NFT Credentialing
### MindMasteryNFT (L1–L3)  
- **Address:** `0xCb9EcB00574DB29976c7C54045d443666D5C7771`  
- **Purpose:** Stage-based credentialing for the modular framework (L1 induction, L2 biochemical logic, L3 narrative).  
- **Progression:** Token thresholds + consent + session activity.

---

## 2.3 Compliance & Consent Governance  
### ConsentPolicy.sol  
- **Address:** `0xf57190E2FEd57190d89aD63eE21B718354D3EeF1`  
- **Purpose:** On-chain consent registry (granular toggles, revocation tracking, auditability).  
- **Outputs:** event-based compliance logs mapped to HIPAA/GDPR in the Security & Privacy layer.

---

## 2.4 Activity + Device Logging  
### UserActivity.sol  
- **Address:** `0xF63e9400807184e726445E105EC7a6C6Af1a86fB`  
- **Purpose:** Links user sessions, device IDs, sensor datapoints, and earned tokens.  
- **Outputs:** `SessionLogged`, `DeviceLinked`, `TokenEarned` events used downstream for analytics.

---

# 3.0 Governance Structure

## 3.1 Roles
- **Owner**  
  Contract deployment, upgrade approvals, treasury authority.
- **Admin**  
  Consent configuration, token distribution approvals, NFT role assignment.
- **End User (Wallet Holder)**  
  Controls consent, receives tokens, progresses credential tiers.

---

## 3.2 Upgradeability Plan  
All MVP contracts are fixed-logic.  
Future upgrade paths include:
- Proxy pattern (EIP-1967)  
- Delayed-execution governance  
- Multi-sig release gates  

---

# 4.0 Inter-Contract Architecture

The ecosystem functions through **event-driven interoperability**:



**Flow:**  
A recorded session → permission check → reward token mint → potential NFT tier unlock.

---

# 5.0 Tokenomics Model

## 5.1 Issuance Logic  
- L1 session completion → **3 HNT**  
- L2 biochemical milestone → **3 HNT**  
- L3 narrative integration → **3 HNT**  
- Governance actions (EncryptHealth) → **EHT**

## 5.2 Burn Logic  
- Users may burn tokens for discounted access or progression unlocks.

## 5.3 Treasury  
- DAO-aligned treasury managed via multi-sig (future state).  
- All flows are transparent, observable, and recorded on-chain.

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

---

# 7.0 Compliance Mapping  
This section connects with the Security & Privacy layer:

- Consent events align with HIPAA 164.508  
- Revocation maps to GDPR Art.7  
- Tokens do not encode PHI  
- NFT progression is non-clinical and non-diagnostic  
- All data used is pseudonymized  

---

# 8.0 Summary  
The Blockchain Architecture Layer defines the decentralized foundation for identity-linked consent, reward mechanisms, transparent governance, and system-wide data integrity, forming the connective layer of the Future Systems Lab ecosystem.

