# Wearables Architecture — NeuroBalance Watch
Designed by Meg Montañez-Davenport
Dark-Mode UML (Sensors • App Flow • Consent • Session Sync • Chain Access)

flowchart LR

%% ========= CLASS DEFINITIONS =========
classDef sensor fill:#0b0f11,stroke:#1be4d8,stroke-width:1.3px,color:#ffffff;
classDef module fill:#071014,stroke:#00c8ff,stroke-width:1.3px,color:#ffffff;
classDef contract fill:#0a1a1f,stroke:#1be4d8,stroke-width:1.3px,color:#ffffff;
classDef api fill:#061417,stroke:#6bffea,stroke-width:1.3px,color:#ffffff;
classDef storage fill:#0b0f11,stroke:#00ffc8,stroke-width:1.3px,color:#ffffff;
classDef role fill:#061417,stroke:#00ffc8,stroke-width:1.3px,color:#ffffff;

%% ========= SENSORS =========
subgraph SENSORS["NeuroBalance Watch — Sensor Layer"]
    HRV["HRV Sensor"]:::sensor
    GSR["Galvanic Skin Response Sensor"]:::sensor
    TEMP["Temperature Sensor"]:::sensor
    MOTION["Motion / Accelerometer"]:::sensor
end

%% ========= WATCH OS LAYER =========
subgraph WATCHOS["Watch OS Processing"]
    LOOP["Event Loop
    • Poll sensors
    • Normalize readings
    • Feature extraction
    • Threshold detection"]:::module

    SECURE_ID["Secure Device Identity
    (DEVICE Role Signature)"]:::role
end

%% ========= WATCH APP =========
subgraph APP["Watch App Layer"]
    UX["User Interface
    • State sliders
    • Symptom selection
    • Toggle consent fields"]:::module

    TOGGLES["Consent Toggles
    • Sleep
    • Stress
    • Mood
    • Focus"]:::module

    PACKAGE["Data Packaging
    • JSON payload
    • Hashing
    • Timestamp
    • Device signature"]:::module
end

%% ========= API + CHAIN =========
APIGW["Secure API Gateway (TLS)"]:::api

ConsentAPI["Consent API"]:::api
SessionAPI["Session API"]:::api
AIAPI["AI / Orthomolecular API"]:::api

%% ========= CONTRACTS =========
CP["ConsentPolicy.sol"]:::contract
NBC["NeuroBalanceConsent.sol"]:::contract
EHS["EncryptHealthSessionStore.sol"]:::contract
HNS["HypnoNeuroSessionStore.sol"]:::contract
AC["AccessControl.sol"]:::contract

%% ========= STORAGE =========
ERD["Data-Layer ERD"]:::storage
EVENTS["Event Log"]:::storage

%% ========= AI / ANALYTICS =========
subgraph AI["AI / Orthomolecular Engine"]
    VEC["Feature Vector Builder"]:::module
    MODEL["Nutrient Inference Model"]:::module
    RECO["Orthomolecular Recommendation Engine"]:::module
end

%% ========= FLOWS =========

%% Sensors → Watch OS
HRV --> LOOP
GSR --> LOOP
TEMP --> LOOP
MOTION --> LOOP

%% Watch OS → Watch App
LOOP --> UX
LOOP --> TOGGLES
LOOP --> PACKAGE

%% Secure Device Identity → API Auth
SECURE_ID --> APIGW

%% App → API
PACKAGE --> APIGW
TOGGLES --> APIGW

%% API → Consent + Session Contracts
APIGW --> ConsentAPI
APIGW --> SessionAPI
APIGW --> AIAPI

ConsentAPI --> CP
ConsentAPI --> NBC

SessionAPI --> EHS
SessionAPI --> HNS

%% AI Engine
AIAPI --> VEC
VEC --> MODEL
MODEL --> RECO

%% Recommendations → Session Store
RECO --> SessionAPI

%% Access control
AC --> CP
AC --> NBC
AC --> EHS
AC --> HNS

%% Storage & Events
CP --> EVENTS
NBC --> EVENTS
EHS --> EVENTS
HNS --> EVENTS

EHS --> ERD
HNS --> ERD
