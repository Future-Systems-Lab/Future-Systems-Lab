// Rights Reserved, Unlicensed

# 🧩 Future Systems Lab — Full System Architecture Diagram
Blockchain • Data Layer • Security • Wearables • Consent • Tokenomics • UX

This diagram shows how all layers interact across HypnoNeuro, EncryptHealth, InstaPsych, NeuroBalance Watch, and Orthomolecular systems.

```mermaid
flowchart TD

%% USERS & DEVICES
U1[User Wallet<br/>DID / VC]:::user
D1[Wearable Device<br/>NeuroBalance Watch<br/>Sensors: HR, HRV, EDA,<br/>Dopamine/Serotonin Estimate]:::device
APP[InstaPsych / HypnoNeuro App<br/>Session Interface]:::app

%% ON-DEVICE PATH
D1 -->|Sensor Data JSON| INJ[Ingestion API]:::api

%% INGESTION + ETL
INJ -->|Validate + Hash| ETL[ETL Pipeline<br/>Normalize • Hash • Map DID]:::etl
ETL --> PG[PostgreSQL<br/>Off-Chain Data Storage]:::db

%% SESSION DATA
APP -->|Session Summary| ETL

%% BLOCKCHAIN EVENTS
ETL -->|Emit Event| BC1[(Ethereum Sepolia)]:::chain
APP -->|EIP-712 Signature| BC1
U1 --> BC1

%% CHAIN CONTRACTS
BC1 -->|ConsentSigned<br/>ConsentRevoked| C1[Consent Hash Contract]:::contract
BC1 -->|TokenMinted| C2[HypnoNeuroToken<br/>EncryptHealthToken]:::contract
BC1 -->|NFTUpgraded| C3[MindMasteryNFT]:::contract
BC1 -->|DeviceRegistered<br/>ActivityLogged| C4[UserActivity.sol]:::contract

%% ANALYTICS
PG --> AN1[Analytics Engine<br/>Aggregations • Trends • Models]:::analytics
BC1 --> AN2[Dune Dashboards<br/>On-Chain Analytics]:::analytics
AN1 --> DS[Orthomolecular Dashboard<br/>Nutrient Recommendations]:::ui
AN1 --> UX[InstaPsych Adaptive Protocols<br/>Hypnotic • Sensory • Behavioral]:::ui

%% USER EXPERIENCE LOOP
UX --> U1
DS --> U1

%% STYLES
classDef user fill:#e4eaff,stroke:#444,stroke-width:1px;
classDef device fill:#ffe8d6,stroke:#444,stroke-width:1px;
classDef app fill:#f0fff4,stroke:#444,stroke-width:1px;
classDef api fill:#fef9c3,stroke:#444,stroke-width:1px;
classDef etl fill:#fff4ea,stroke:#444,stroke-width:1px;
classDef db fill:#e7fff8,stroke:#444,stroke-width:1px;
classDef chain fill:#e5f5ff,stroke:#444,stroke-width:1px;
classDef contract fill:#e8e8e8,stroke:#444,stroke-width:1px;
classDef analytics fill:#f0eaff,stroke:#444,stroke-width:1px;
classDef ui fill:#f9f9f9,stroke:#444,stroke-width:1px;


