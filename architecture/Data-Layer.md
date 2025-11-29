<!-- Rights Reserved, Unlicensed -->

# 🗂️ Data Layer Architecture  
This layer defines the off-chain relational structures, the data ingestion logic, event mapping from blockchain logs, and the internal analytics flow that supports the Future Systems Lab ecosystem.

---

# 1.0 Purpose  
The Data Layer provides a structured, queryable environment for:

- user activity logs  
- session details  
- device metadata  
- sensor datapoints  
- token reward events  
- inventory/protocol items  

It supports analytics, reporting, and simulation without storing PHI, ensuring pseudonymization and compliance with HIPAA/GDPR principles.

---

# 2.0 Relational Schema (SQLite)  
The schema below was executed and validated inside `MyProject.db`.

## 2.1 Users  
Basic user attributes (pseudonymized):



## 2.2 Practitioners  
Links practitioner profiles to Users:


## 2.3 Sessions  
Session records referencing both user and practitioner:


## 2.4 Tokens  
Off-chain mirrors of on-chain token issuance:


## 2.5 Devices


## 2.6 Sensor Data


## 2.7 Inventory (for protocol or orthomolecular components)


## 2.8 UserActivityRelational  
A combined table demonstrating multi-key relational joins:


---

# 3.0 Entity-Relationship Diagram (ASCII)

   ┌───────────┐        ┌──────────────┐
   │  Users    │ 1    n │  Sessions     │
   └─────┬─────┘        └──────┬───────┘
         │                     │
         │ 1                  n│
   ┌─────▼─────┐        ┌─────▼───────────┐
   │Practitioners│       │   Tokens        │
   └─────────────┘       └─────────────────┘

             1                     n
   ┌─────────▼─────────┐   ┌───────▼─────────┐
   │     Devices        │   │   SensorData     │
   └────────┬──────────┘   └──────────────────┘
            │
            │ n
   ┌────────▼──────────┐
   │UserActivityRelational│
   └──────────────────────┘

This diagram demonstrates multi-table linkage used for downstream analytics queries.

---

# 4.0 On-Chain ↔ Off-Chain Mapping  

| Blockchain Event             | SQL Table / Field                   | Purpose |
|------------------------------|-------------------------------------|---------|
| `SessionLogged`              | Sessions.SessionID                  | Session record anchor |
| `ConsentUpdated`             | Users.Role / metadata tables        | Consent state mapping |
| `TokenEarned` (HNT/EHT)      | Tokens.Amount, Tokens.EarnedDate    | Reward accounting |
| `DeviceLinked`               | Devices.DeviceID                    | Device identity tracking |
| `NFTUnlocked`                | Inventory / Protocol tables         | Stage unlock metadata |

This mapping ensures consistency between decentralized events and internal analytics.

---

# 5.0 Data Flow Architecture  


The Data Layer remains the central aggregation point for cross-system logic.

---

# 6.0 Example Queries (Executed and Verified)

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
