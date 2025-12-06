# Consent Architecture — Future Systems Lab
Designed by Meg Montañez-Davenport
Dark-Mode UML (ConsentPolicy • NeuroBalanceConsent • AdverseEventLog • RBAC • Enforcement Path)

flowchart LR

%% ========= CLASS DEFINITIONS =========
classDef api fill:#071014,stroke:#6bffea,stroke-width:1.4px,color:#ffffff;
classDef contract fill:#0a1a1f,stroke:#1be4d8,stroke-width:1.4px,color:#ffffff;
classDef role fill:#061417,stroke:#00ffc8,stroke-width:1.4px,color:#ffffff;
classDef storage fill:#071014,stroke:#00ffc8,stroke-width:1.4px,color:#ffffff;
classDef module fill:#0b0f11,stroke:#00c8ff,stroke-width:1.4px,color:#ffffff;

%% ========= USER / DEVICE INPUT =========
USER["User / Patient App
• Toggle states
• Consent actions
• Session permissions"]:::module

WATCH["NeuroBalance Watch
• Device consent toggles
• DEVICE role signature"]:::module

%% ========= API GATEWAY =========
APIGW["Secure API Gateway
(TLS 1.3, JWT w/ DID or DEVICE claims)"]:::api

ConsentAPI["Consent API
• setConsent
• revokeConsent
• updateToggle"]:::api

SessionAPI["Session API
• storeSession
• fetchSession"]:::api

%% ========= ACCESS CONTROL =========
AC["AccessControl.sol
Enforces roles:
• ADMIN
• PROVIDER
• DEVICE"]:::contract

Admin["ADMIN Role"]:::role
Provider["PROVIDER Role"]:::role
DeviceR["DEVICE Role"]:::role

%% ========= CONSENT CONTRACTS =========
CP["ConsentPolicy.sol
— setConsent()
— revokeConsent()
Events: ConsentGranted, ConsentRevoked"]:::contract

NBC["NeuroBalanceConsent.sol
— setToggle()
— getToggle()
Event: ToggleUpdated"]:::contract

AEL["AdverseEventLog.sol
— reportEvent()
Event: AdverseEventReported"]:::contract

%% ========= SESSION LAYER =========
EHS["EncryptHealthSessionStore.sol
Event: SessionStored"]:::contract

%% ========= STORAGE =========
EVENTS["Event Log"]:::storage
ERD["Data-Layer ERD"]:::storage

%% ========= FLOWS =========

%% User/Watch → API
USER --> APIGW
WATCH --> APIGW

APIGW --> ConsentAPI
APIGW --> SessionAPI

%% Consent API → Consent Contracts
ConsentAPI --> CP
ConsentAPI --> NBC
ConsentAPI --> AEL

%% Session API → Session Store
SessionAPI --> EHS

%% AccessControl → All Contracts
Admin --> AC
Provider --> AC
DeviceR --> AC

AC --> CP
AC --> NBC
AC --> AEL
AC --> EHS

%% Events → Storage
CP --> EVENTS
NBC --> EVENTS
AEL --> EVENTS
EHS --> EVENTS

EVENTS --> ERD
