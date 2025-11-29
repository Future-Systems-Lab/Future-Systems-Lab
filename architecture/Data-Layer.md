// Rights Reserved, Unlicensed

# 🗄️ Future Systems Lab — Data Layer Architecture
SQLite • PostgreSQL • Off-Chain Storage • Indexing • ETL • Consent Mapping

This Data Layer supports all Future Systems Lab projects, providing secure, efficient, compliant off-chain storage that complements the minimal on-chain state.

# 1. Data Storage Overview

## 1.1 Hybrid Architecture

### On-Chain
- Consent hashes
- Session hashes
- Token mints
- NFT ownership and progression
- Device registration
- Activity logging references

### Off-Chain
- Session notes
- Orthomolecular metrics
- Wearable sensor data
- User activity records
- Practitioner documentation
- Compliance reports
- Analytics datasets

# 2. Database Stack

## 2.1 SQLite
Used for prototyping and edge analytics.

Schemas include:
- Users
- Practitioners
- Sessions
- Tokens
- Devices
- SensorData
- Inventory
- UserActivityRelational

## 2.2 PostgreSQL
Used for production storage.

Features:
- JSONB
- Partitioned time-series tables
- Row-level security
- BRIN and GIN indexing

# 3. Indexing and ETL Pipelines

## 3.1 Event Indexer
Listens to:
- ConsentSigned
- TokenMinted
- NFTUpgraded
- DeviceRegistered
- ActivityLogged

Each event stored with:
- event_id
- tx_hash
- timestamp
- user_did
- hash_reference

## 3.2 ETL Pipelines

### Extract
- Wearable data ingestion
- App summaries
- Frontend JSON logs
- Blockchain events

### Transform
- Hash sensitive fields
- Normalize metrics
- Map pseudonym → DID → wallet
- Structure orthomolecular readings

### Load
- PostgreSQL relational tables
- Analytics aggregates
- Compliance mapping tables

# 4. Data Models

## 4.1 Core Tables
- users
- devices
- sessions
- tokens
- sensor_data
- inventory
- activity_relations

## 4.2 Consent Mapping Table
| Field | Type |
|-------|------|
| consent_id | UUID |
| user_did | TEXT |
| signature | TEXT |
| consent_hash | TEXT |
| tx_hash | TEXT |
| timestamp | DATETIME |

# 5. High-Volume Sensor Handling

## 5.1 Supported Modalities
- HRV
- Heart rate
- EDA
- Accelerometer
- Dopamine/serotonin inference
- Cognitive state scores
- Breath pacing patterns

## 5.2 Time-Series Strategy
- Partitioned tables
- BRIN indexing
- JSONB sensor packets

# 6. Analytics Layer

## 6.1 Aggregations
- Session streaks
- Token totals
- Device-sync compliance
- Stress recovery estimates
- Orthomolecular deviations
- HypnoNeuro state-match metrics

## 6.2 Dashboards
- Grafana
- Metabase
- Dune dashboards for blockchain analytics

# 7. Data Lifecycle Management

## 7.1 Creation
- Consent signed → hash stored on-chain → full data off-chain
- Session created → minimal chain reference → detailed record off-chain

## 7.2 Access
- Read-only APIs
- DID or wallet-based permissions
- Token/NFT gating future support

## 7.3 Revocation
- Blockchain event marks consent invalid
- Database updated accordingly

## 7.4 Retention
- Educational-use data retention model
- Audit-ready storage
- Secure deletion upon user request

# 8. Appendices
- PostgreSQL schema
- SQLite schema
- Indexer specification
- ETL definitions
- Data dictionaries
- Consent-to-ledger mapping tables

