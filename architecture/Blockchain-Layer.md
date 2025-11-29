// Rights Reserved, Unlicensed

# 🔗 Future Systems Lab — Blockchain Architecture Layer
Comprehensive Governance • Consent • Tokenomics • Compliance Framework

Future Systems Lab develops interoperable blockchain infrastructure for digital health systems, powering projects such as HypnoNeuro, EncryptHealth, InstaPsych, Orthomolecular Dashboard, and the NeuroBalance Watch.  
This architecture provides a unified framework for governance, consent, incentives, security, and regulatory alignment across all modules.

# 1. Smart Contract Governance

## 1.1 Contract Inventory (Sepolia Testnet)

### ERC-20 Tokens
- EncryptHealthToken (EHT): 0xbDaeb1d05E02D2751Ad07121510b5f0C436E2CdC  
- HypnoNeuroToken (HNT): 0x411426f8E735F7940B20491609F08817A805b198  

### ERC-721 NFTs
- MindMasteryNFT (L1–L3): 0xCb9EcB00574DB29976c7C54045d443666D5C7771  

### Activity Logging / Device Interaction
- UserActivity.sol: 0xF63e9400807184e726445E105EC7a6C6Af1a86fB  

## 1.2 Governance Roles
- Owner: Future Systems Lab multisig  
- Admin: Project-specific operators  
- Practitioners: May mint session-earned NFTs  
- Users: Participants, device holders, token earners  

## 1.3 Security Controls
- Role-based access control  
- Pausable modules  
- ReentrancyGuard  
- Key rotation strategy  
- Non-upgradeable by default  

## 1.4 Audit Artifacts
- Slither  
- Mythril  
- Echidna  
- Manual review before deployment  

Audit findings (high-level):  
- No reentrancy pathways  
- No unbounded loops  
- All state-changes emit events  
- Access control validated  

# 2. Consent & Data Handling

## 2.1 Consent Flow
- EIP-712 structured signatures  
- Hash stored on-chain  
- Revocation supported  
- DID-based identity planned  

## 2.2 Minimal Data Model

### On-chain
- Consent hashes  
- Session hashes  
- NFT ownership  
- Token mint events  
- Device registration  

### Off-chain
- Session notes  
- Wearable data  
- Orthomolecular metrics  
- Practitioner documentation  

### Privacy Techniques
- SHA-256 hashing  
- Pseudonymized IDs / DIDs  
- Zero PHI on-chain  

## 2.3 Ledger Mapping
| Data Element | On-Chain | Off-Chain | Rationale |
|--------------|----------|-----------|-----------|
| Consent | Hash | Document | Immutability + privacy |
| Sessions | Hash | Full record | Sensitive |
| Devices | ID | Metrics | High-volume |
| Tokens | Full | — | Transparency |
| NFTs | Full | — | Ownership |

## 2.4 Data Lifecycle
- Consent signed → hash stored  
- Session generated off-chain  
- Revocation emits event  
- Audit trail via blockchain events  

# 3. Tokenomics & Treasury

## 3.1 Token Definitions
- EncryptHealthToken: ERC-20, compliance utility  
- HypnoNeuroToken: ERC-20, session rewards  
- MindMasteryNFT: ERC-721, level progression  

## 3.2 Incentive Model
1 token per 3 sessions/month.  
Discount mapping:  
- 3 tokens → 3%  
- 6 tokens → 6%  
- 9 tokens → 9%  

## 3.3 Treasury Model
- Multisig-controlled  
- Allocation: 40% rewards, 30% R&D, 20% open-source, 10% buffer  
- DAO-style approvals  

## 3.4 Risk Mitigation
- No oracles  
- DID to prevent Sybil attacks  
- Emergency pause  
- Event monitoring  
- Minimal external dependencies  

# 4. Compliance & Legal Mapping

## 4.1 Regulatory Alignment
- HIPAA  
- GDPR  
- SaMD (optional)  
- ALCOA data integrity  

## 4.2 Smart Contract ↔ Legal Mapping
- ConsentSigned → authorization  
- TokenMinted → participation  
- NFTUpgraded → milestone  
- DeviceRegistered → identity  

## 4.3 Documentation for Auditors
- Contract addresses  
- ABIs  
- Threat model  
- Change logs  
- Privacy mapping  
- Governance matrix  

# 5. Integration Map

## 5.1 Frontend Integration
- Wagmi  
- Viem  
- Sepolia by default  
- Sourcify-based ABIs  

## 5.2 Backend Integration
- Off-chain indexer  
- DID resolver  
- SQLite/PostgreSQL  
- Webhook ingestion  

## 5.3 Observability
- Routescan  
- Optional Dune dashboards  
- Slack/Discord alerts  
- Sensor anomaly detection  

# 6. Appendices
- ABIs  
- Flattened source  
- Deployment transactions  
- Architecture diagrams  
- Audit reports  
- Governance matrix  

