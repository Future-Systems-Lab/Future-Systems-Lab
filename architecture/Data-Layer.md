<!-- Rights Reserved, Unlicensed -->

# 🗂️ Data Layer Architecture  
This layer defines the off-chain relational model, event ingestion logic, blockchain-event mapping, and analytics foundation for the Future Systems Lab ecosystem.  
All data is **pseudonymized**, **non-PHI**, and designed for zero-trust interoperability with the Blockchain Architecture Layer.

---

# 1.0 Purpose  
The Data Layer provides a structured, queryable environment for:

- pseudonymized user activity  
- session hashes (SHA-256)  
- device metadata + wearable datapoints  
- token reward events  
- session/consent/compliance actions  
- NFT/nonclinical progression metadata  
- analytics + reporting  

No protected health information (PHI) is stored.  
All sensitive information remains off-chain and externalized.

---

# 2.0 Relational Schema (SQLite / PostgreSQL)  
The schema supports both demo deployments (SQLite) and scalable production (PostgreSQL 17+).

Tables are designed to map directly to **on-chain events** emitted by:

- `EncryptHealthSessionStore`  
- `ConsentPolicy`  
- `NeuroBalanceConsent`  
- `UserActivity`  
- `WellnessToken`  
- `ComplianceLog`  

## 2.1 Users  
Pseudonymized user identity.

<<<<<<< HEAD
=======

>>>>>>> 71150af (Updated Tokenomics model to unified HNT + EHT + WT system)
USERS {
int UserID PK
string PseudoID
datetime CreatedAt
}


## 2.2 Practitioners  
Mapped to decentralized credentials (future DID/VC integration).

<<<<<<< HEAD
=======


>>>>>>> 71150af (Updated Tokenomics model to unified HNT + EHT + WT system)
PRACTITIONERS {
int PractitionerID PK
int UserID FK
string Specialty
int YearsExperience
}


## 2.3 Sessions  
Stores local metadata + hashed AI session payload.

<<<<<<< HEAD
=======


>>>>>>> 71150af (Updated Tokenomics model to unified HNT + EHT + WT system)
SESSIONS {
int SessionID PK
int UserID FK
datetime Timestamp
string SessionHash -- SHA-256 from EncryptHealthSessionStore
string ProtocolRef -- L1 / L2 / L3 module reference
string TxHash -- On-chain anchor
int BlockNumber
}


## 2.4 Tokens  
Off-chain mirror of WellnessToken rewards.

<<<<<<< HEAD
=======


>>>>>>> 71150af (Updated Tokenomics model to unified HNT + EHT + WT system)
TOKENS {
int TokenID PK
int UserID FK
int Amount
string TokenSymbol -- HNT, EHT, WELL
datetime EarnedAt
string TxHash
int BlockNumber
}


## 2.5 Devices  
Wearable + app-linked device identities.

<<<<<<< HEAD
=======


>>>>>>> 71150af (Updated Tokenomics model to unified HNT + EHT + WT system)
DEVICES {
int DeviceID PK
int UserID FK
string DeviceType
string SerialNumber
datetime RegisteredAt
}


## 2.6 Sensor Data  
Wearable datapoints (HR, mood, sleep, motion, etc.).

<<<<<<< HEAD
=======


>>>>>>> 71150af (Updated Tokenomics model to unified HNT + EHT + WT system)
SENSORDATA {
int DataID PK
int DeviceID FK
datetime Timestamp
string Metric
float Value
}


## 2.7 Inventory  
Nonclinical progression/NFT stage mapping.

<<<<<<< HEAD
=======


>>>>>>> 71150af (Updated Tokenomics model to unified HNT + EHT + WT system)
INVENTORY {
int ItemID PK
string ItemName
string ItemType
int Quantity
}


## 2.8 UserActivityRelational  
Master linkage table joining user, session, device, sensor, and reward events.

<<<<<<< HEAD
=======


>>>>>>> 71150af (Updated Tokenomics model to unified HNT + EHT + WT system)
USERACTIVITYRELATIONAL {
int RelID PK
int UserID FK
int SessionID FK
int TokenID FK
int DeviceID FK
int DataID FK
int ItemID FK
}


---

# 3.0 Entity-Relationship Diagram (ERD)

## 📊 Visual ERD (PNG)
<p align="center">
  <img src="./diagrams/data-layer-erd.png" width="900" alt="Data Layer ERD">
</p>

---

## 📐 Mermaid ERD (Source)
<details>
  <summary><strong>Click to view Mermaid ERD source</strong></summary>

```mermaid
erDiagram

    USERS ||--o{ SESSIONS : "has"
    USERS ||--o{ TOKENS : "earns"
    USERS ||--o{ DEVICES : "owns"

    PRACTITIONERS ||--o{ SESSIONS : "conducts"
    DEVICES ||--o{ SENSORDATA : "produces"

    USERS ||--o{ USERACTIVITYRELATIONAL : "joins"
    SESSIONS ||--o{ USERACTIVITYRELATIONAL : "joins"
    TOKENS ||--o{ USERACTIVITYRELATIONAL : "joins"
    DEVICES ||--o{ USERACTIVITYRELATIONAL : "joins"
    SENSORDATA ||--o{ USERACTIVITYRELATIONAL : "joins"
    INVENTORY ||--o{ USERACTIVITYRELATIONAL : "links"

<<<<<<< HEAD
4.0 Blockchain → SQL Mapping
| Blockchain Contract       | Event            | SQL Target             | Purpose                                   |
| ------------------------- | ---------------- | ---------------------- | ----------------------------------------- |
| EncryptHealthSessionStore | `SessionLogged`  | Sessions.SessionHash   | Anchors local sessions to on-chain record |
| ConsentPolicy             | `ConsentUpdated` | Users (metadata)       | Maps consent state (non-PHI)              |
| NeuroBalanceConsent       | `ConsentUpdated` | Devices / Users        | Wearable permission state                 |
| UserActivity              | `DeviceLinked`   | Devices                | Registers device activity                 |
| UserActivity              | `ActivityLogged` | UserActivityRelational | High-level activity mapping               |
| WellnessToken             | `TokenMinted`    | Tokens                 | Reward accounting                         |
| ComplianceLog             | All events       | all tables via TxHash  | Immutable audit trail                     |

ll links refer to Blockscout (Sepolia) as the sole canonical explorer:

https://eth-sepolia.blockscout.com/address/0x3Be8285…

https://eth-sepolia.blockscout.com/address/0x75DbA8…

https://eth-sepolia.blockscout.com/address/0x59bF36…

5.0 SQL Example Queries

All queries avoid PHI and use pseudonymized data only.

5.1 User + Session + Tokens

=======
</details>
4.0 Blockchain → SQL Mapping
Blockchain Contract	Event	SQL Target	Purpose
EncryptHealthSessionStore	SessionLogged	Sessions.SessionHash	Anchors local sessions to on-chain record
ConsentPolicy	ConsentUpdated	Users (metadata)	Maps consent state (non-PHI)
NeuroBalanceConsent	ConsentUpdated	Devices / Users	Wearable permission state
UserActivity	DeviceLinked	Devices	Registers device activity
UserActivity	ActivityLogged	UserActivityRelational	High-level activity mapping
WellnessToken	TokenMinted	Tokens	Reward accounting
ComplianceLog	All events	all tables via TxHash	Immutable audit trail
Blockscout Explorer References

https://eth-sepolia.blockscout.com/address/0x3Be8285F089cb53ed811CF0d8c79c19D8245db09

https://eth-sepolia.blockscout.com/address/0x75DbA8924AA975Ea0Da46989D1348BC756fF1c4E

https://eth-sepolia.blockscout.com/address/0x59bF3605e1e62867Ad880eb5451789290F56E369

https://eth-sepolia.blockscout.com/address/0x2cc949E7C4e8Ab0ec4F35dAf251D5c2C8a2bA848

https://eth-sepolia.blockscout.com/address/0x18d7C8186dA31a0DF3a4D3EEB96e8cEb70c09DDC

https://eth-sepolia.blockscout.com/address/0xb169383145070fbC19EF972569E6ec35B253a69F

5.0 SQL Example Queries

(All queries avoid PHI and use pseudonymized data only.)

5.1 User + Session + Tokens
>>>>>>> 71150af (Updated Tokenomics model to unified HNT + EHT + WT system)
SELECT u.PseudoID, s.Timestamp, t.Amount
FROM Users u
JOIN Sessions s ON u.UserID = s.UserID
JOIN Tokens t ON u.UserID = t.UserID;

5.2 Wearable Metrics
<<<<<<< HEAD

=======
>>>>>>> 71150af (Updated Tokenomics model to unified HNT + EHT + WT system)
SELECT u.PseudoID, d.DeviceType, sd.Metric, sd.Value
FROM Users u
JOIN Devices d ON u.UserID = d.UserID
JOIN SensorData sd ON d.DeviceID = sd.DeviceID;

5.3 Total Reward Balance
<<<<<<< HEAD

=======
>>>>>>> 71150af (Updated Tokenomics model to unified HNT + EHT + WT system)
SELECT u.PseudoID, SUM(t.Amount) AS TotalTokens
FROM Users u
JOIN Tokens t ON u.UserID = t.UserID
GROUP BY u.UserID;

5.4 Full Activity Graph
<<<<<<< HEAD

=======
>>>>>>> 71150af (Updated Tokenomics model to unified HNT + EHT + WT system)
SELECT u.PseudoID, s.Timestamp, t.Amount, d.DeviceType, sd.Metric, i.ItemName
FROM UserActivityRelational r
JOIN Users u ON r.UserID = u.UserID
JOIN Sessions s ON r.SessionID = s.SessionID
JOIN Tokens t ON r.TokenID = t.TokenID
JOIN Devices d ON r.DeviceID = d.DeviceID
JOIN SensorData sd ON r.DataID = sd.DataID
JOIN Inventory i ON r.ItemID = i.ItemID;

6.0 Off-Chain Storage Standards

<<<<<<< HEAD
SQLite (demo): portable, embedded

PostgreSQL 17+ (recommended): ACID, indexable, scalable
=======
SQLite (demo): lightweight, portable

PostgreSQL 17+ (recommended): ACID-compliant, scalable
>>>>>>> 71150af (Updated Tokenomics model to unified HNT + EHT + WT system)

No PHI stored

All sensitive info remains off-chain

Hash-linking → on-chain immutability without data exposure

7.0 Summary
<<<<<<< HEAD
=======

The Data Layer provides a unified, analytics-ready foundation that mirrors decentralized events while maintaining full privacy and compliance.
It integrates wearable data, session hashing, reward events, consent updates, and progression logic into a traceable, auditable, pseudonymized relational model that supports the entire Future Systems Lab ecosystem.
>>>>>>> 71150af (Updated Tokenomics model to unified HNT + EHT + WT system)

The Data Layer provides a unified, analytics-ready foundation that mirrors decentralized events while maintaining full privacy and compliance.
It integrates wearable data, session hashing, reward events, consent updates, and progression logic into a traceable, auditable, pseudonymized relational model that supports the entire Future Systems Lab ecosystem.
