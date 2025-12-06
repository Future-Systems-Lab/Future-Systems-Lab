# Security & Privacy Architecture — Future Systems Lab
Designed by Meg Montañez-Davenport
Dark-Mode UML (Encryption • RBAC • DID/VC • AuditTrail • OPA/Rego)

flowchart LR

%% ========= CLASS DEFINITIONS =========
classDef module fill:#0b0f11,stroke:#1be4d8,stroke-width:1.3px,color:#ffffff;
classDef contract fill:#0a1a1f,stroke:#00c8ff,stroke-width:1.3px,color:#ffffff;
classDef identity fill:#061417,stroke:#6bffea,stroke-width:1.5px,color:#ffffff;
classDef event fill:#061417,stroke:#00ffc8,stroke-width:1.2px,color:#ffffff;
classDef storage fill:#071014,stroke:#00ffc8,stroke-width:1.3px,color:#ffffff;
classDef govern fill:#071014,stroke:#ff66ff,stroke-width:1.3px,color:#ffffff;

%% ========= IDENTITY LAYER =========
subgraph IDENTITY["Identity Layer (DID/VC)"]
    DID["Decentralized Identifier (DID)"]:::identity
    VC["Verifiable Credential (VC)"]:::identity
    VP["Verifiable Presentation (VP)"]:::identity
end

%% ========= API GATEWAY =========
APIGW["Secure API Gateway
• TLS 1.3
• JWT w/ DID Claims
• Rate Limiting
• Boundary Protection"]:::module

%% ========= RBAC & ACCESS CONTROL =========
AC["AccessControl.sol
— Roles —
ADMIN / PROVIDER / DEVICE
— Enforced at contract-level"]:::contract

%% ========= CONSENT + SESSION SECURITY =========
subgraph SEC_DATA["Secure Data Layer"]
    ENC["Encryption-at-Rest (AES-256)"]:::storage
    TRANS["Encryption-in-Transit (TLS 1.3)"]:::storage
    SESSION_SEC["Session Store Permissions
• Only provider/device roles
• Write-protection
• Integrity checks"]:::storage
end

%% ========= CONTRACTS =========
CP["ConsentPolicy.sol"]:::contract
NBC["NeuroBalanceConsent.sol"]:::contract
AEL["AdverseEventLog.sol"]:::contract
EHS["EncryptHealthSessionStore.sol"]:::contract
HNS["HypnoNeuroSessionStore.sol"]:::contract

%% ========= AUDIT TRAIL =========
subgraph AUDIT["AuditTrail + Event Logs"]
    ALOG["On-chain Events
• ConsentGranted
• ConsentRevoked
• SessionStored
• AdverseEventReported"]:::event
    OFFLOG["Off-chain Audit Log
• API access
• IP metadata
• Device signature
• Rego evaluation output"]:::event
end

%% ========= OPA / REGO GOVERNANCE =========
subgraph GOVERN["OPA / Rego Governance Enforcement"]
    REGO["Rego Policies
• deny_public_s3
• deny_iam_wildcards
• require_s3_encryption
• allow only authorized service identities"]:::govern
    EVAL["Policy Evaluation Engine"]:::govern
end

%% ========= FLOWS =========

%% Identity → API → RBAC → Contracts
DID --> APIGW
VC --> APIGW
VP --> APIGW

APIGW --> AC

%% AC governs access to all protected contracts
AC --> CP
AC --> NBC
AC --> AEL
AC --> EHS
AC --> HNS

%% Consent + Session security
CP --> ENC
NBC --> ENC
AEL --> ENC
EHS --> ENC
HNS --> ENC

%% Transit encryption
APIGW --> TRANS

%% Audit flows
CP --> ALOG
NBC --> ALOG
AEL --> ALOG
EHS --> ALOG
HNS --> ALOG

APIGW --> OFFLOG

%% Rego evaluation intercepts API calls
APIGW --> EVAL
EVAL --> REGO
REGO --> APIGW
