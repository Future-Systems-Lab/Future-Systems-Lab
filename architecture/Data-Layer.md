<!-- Rights Reserved, Unlicensed -->

# 🗂️ Data Layer Architecture  
This layer defines the off-chain relational structures, data ingestion logic, blockchain event mapping, and analytics foundation that supports the Future Systems Lab ecosystem.

---

# 1.0 Purpose  
The Data Layer provides a structured, queryable environment for:

- user activity logs  
- session details  
- device metadata  
- sensor datapoints  
- token reward events  
- inventory/protocol items  

It supports analytics, reporting, and simulation **without storing PHI**, ensuring pseudonymization and alignment with HIPAA and GDPR principles.

---

# 2.0 Relational Schema (SQLite)  
The schema below was executed and validated inside `MyProject.db` to demonstrate the full working prototype.

## 2.1 Users  
Basic user attributes (pseudonymized):


## 2.2 Practitioners  
Practitioner profile linked to a user record:


## 2.3 Sessions  
Session logs linked to user + practitioner:


## 2.4 Tokens  
Off-chain mirrors of on-chain token issuance:


## 2.5 Devices  


## 2.6 Sensor Data  


## 2.7 Inventory  


## 2.8 UserActivityRelational  
High-level cross-table linkage:


---

# 3.0 Entity-Relationship Diagram (ASCII)

```text
┌──────────────┐        1        ┌──────────────┐
│    Users      │───────────────▶│   Sessions    │
└──────┬───────┘                 └──────┬───────┘
       │                                 │
       │ 1                               │ n
       ▼                                 ▼
┌──────────────┐                  ┌──────────────┐
│ Practitioners │                  │    Tokens     │
└──────────────┘                  └──────────────┘


             1                                   n
┌──────────────┐                         ┌────────────────┐
│    Devices    │───────────────▶ (n) ──▶│  SensorData    │
└──────┬───────┘                         └────────────────┘
       │
       │ n
       ▼
┌────────────────────────┐
│ UserActivityRelational │
└────────────────────────┘


---

# 4.0 On-Chain ↔ Off-Chain Mapping  

| **Blockchain Event**       | **SQL Table / Field**                 | **Purpose**                    |
|----------------------------|----------------------------------------|--------------------------------|
| `SessionLogged`            | `Sessions.SessionID`                   | Session record anchor          |
| `ConsentUpdated`           | `Users.Role` / metadata tables         | Consent state mapping          |
| `TokenEarned` (HNT/EHT)    | `Tokens.Amount`, `Tokens.EarnedDate`   | Reward accounting              |
| `DeviceLinked`             | `Devices.DeviceID`                     | Device identity tracking       |
| `NFTUnlocked`              | `Inventory.ItemID` / protocol entries  | Stage unlock metadata          |

---

# 5.0 Data Flow Architecture  

[Wearable Sensors]
▼
[Device API Ingestion]
▼
[SensorData Table]
▼
[Relational Linking → UserActivityRelational]
▼
[Analytics Engine / Dashboards]
▼
[Optional: Blockchain Emit → SessionLogged / TokenEarned]


The Data Layer absorbs device input, user actions, and event logs into a unified relational structure.

---

# 6.0 Example Queries (Executed & Verified)

### 6.1 Users with their sessions + token earnings
```sql
SELECT u.Name, s.SessionDate, t.Amount AS TokensEarned
FROM Users u
JOIN Sessions s ON u.UserID = s.UserID
JOIN Tokens t ON u.UserID = t.UserID;

SELECT u.Name, d.DeviceType, sd.Metric, sd.Value
FROM Users u
JOIN Devices d ON u.UserID = d.UserID
JOIN SensorData sd ON d.DeviceID = sd.DeviceID;

SELECT u.Name, SUM(t.Amount) AS TotalTokens
FROM Users u
JOIN Tokens t ON u.UserID = t.UserID
GROUP BY u.UserID;

SELECT u.Name, s.SessionDate, t.Amount AS Tokens, d.DeviceType, sd.Metric, i.ItemName
FROM UserActivityRelational r
JOIN Users u ON r.UserID = u.UserID
JOIN Sessions s ON r.SessionID = s.SessionID
JOIN Tokens t ON r.TokenID = t.TokenID
JOIN Devices d ON r.DeviceID = d.DeviceID
JOIN SensorData sd ON r.DataID = sd.DataID
JOIN Inventory i ON r.ItemID = i.ItemID;

7.0 Off-Chain Storage Standards

SQLite (demo): lightweight and portable for prototypes.

PostgreSQL (recommended): ACID-compliant, scalable, with indexing and permission controls.

No PHI stored: only pseudonymized signals; identifiable data remains user-controlled.

Externalized sensitive data: the system can reference identifiers without storing any protected content.

Hash-linking: blockchain event hashes may be referenced for verification without exposing data.

8.0 Summary

The Data Layer provides a structured, analytics-ready foundation for the Future Systems Lab ecosystem.
It integrates wearable signals, session activity, consent events, reward logic, device metadata, and inventory structures into a consistent relational model.
This layer forms the bridge between real-world interaction data and blockchain-based auditability, enabling transparent analytics, scalable system evolution, and aligned decentralized governance.
