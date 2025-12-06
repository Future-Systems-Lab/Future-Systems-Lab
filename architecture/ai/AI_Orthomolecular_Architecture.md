# AI / Orthomolecular Architecture — Future Systems Lab
Designed by Meg Montañez-Davenport
Dark-Mode UML (Feature Engineering • Nutrient Model • Recommendations • On-Chain Session Sync)

flowchart LR

%% ========= CLASS DEFINITIONS =========
classDef module fill:#071014,stroke:#00c8ff,stroke-width:1.4px,color:#ffffff;
classDef ai fill:#0b0f11,stroke:#1be4d8,stroke-width:1.4px,color:#ffffff;
classDef contract fill:#0a1a1f,stroke:#1be4d8,stroke-width:1.4px,color:#ffffff;
classDef storage fill:#061417,stroke:#00ffc8,stroke-width:1.4px,color:#ffffff;
classDef api fill:#061417,stroke:#6bffea,stroke-width:1.4px,color:#ffffff;

%% ========= DATA INGESTION =========
subgraph INGEST["Input Layer"]
    RAW["Raw Inputs
    • Sensor fusion
    • User self-report
    • Wearable signals
    • HypnoNeuro session features"]:::module

    CLEAN["Preprocessing
    • Scaling
    • Missing-value repair
    • Signal smoothing
    • Outlier removal"]:::module
end

%% ========= FEATURE ENGINEERING =========
subgraph FEATURES["Feature Engineering"]
    FENG["Feature Vector Builder
    • HRV → stress indicators
    • GSR → autonomic load
    • Temp → inflammatory signal
    • Motion → agitation index
    • Cognitive markers → loop intensity"]:::ai
end

%% ========= MODELING =========
subgraph MODEL["Nutrient & Biochemical Modeling"]
    NMODEL["Nutrient Inference Model
    • magnesium utilization
    • B6 conversion
    • methylation load
    • glutamate balance
    • excitatory/inhibitory ratios"]:::ai

    SCORE["Model Scoring
    • Weighted biochemical likelihood
    • State classification
    • Deficiency probability mapping"]:::ai
end

%% ========= RECOMMENDATION ENGINE =========
subgraph RECO["Orthomolecular Recommendation Engine"]
    RULES["Therapeutic Rule Engine
    • Condition → nutrient mapping
    • Safety guards
    • Contraindication removal"]:::module

    PLAN["Personalized Protocol Builder
    • dosage range
    • timing
    • cofactor synergy
    • phase sequencing"]:::module
end

%% ========= CONSENT GATE =========
CONSENT_GATE["Consent Gate
• checks ConsentPolicy
• verifies NeuroBalance toggles
• enforces RBAC via AccessControl"]:::module

%% ========= API → CHAIN LAYER =========
API_ENTRY["AI API Endpoint"]:::api

EHS["EncryptHealthSessionStore.sol"]:::contract
HNS["HypnoNeuroSessionStore.sol"]:::contract

EVENTS["Event Log"]:::storage
ERD["Data-Layer ERD"]:::storage

%% ========= ANALYTICS FEEDBACK =========
subgraph ANALYTICS["Analytics Feedback Loop"]
    DASH["BI Dashboards"]:::module
    MODELTUNE["Model Improvement
    • Drift detection
    • Feature importance
    • Parameter tuning"]:::ai
end

%% ========= FLOWS =========

%% Ingestion → Cleaning → Feature Engineering
RAW --> CLEAN
CLEAN --> FENG

%% Feature Engineering → Model → Score
FENG --> NMODEL
NMODEL --> SCORE

%% Model Score → Recommendation Engine
SCORE --> RULES
RULES --> PLAN

%% Recommendation → Consent Gate → API
PLAN --> CONSENT_GATE
CONSENT_GATE --> API_ENTRY

%% API → Session Stores
API_ENTRY --> EHS
API_ENTRY --> HNS

%% Session Stores → Data Layer
EHS --> ERD
HNS --> ERD
EHS --> EVENTS
HNS --> EVENTS

%% Analytics feedback
ERD --> DASH
EVENTS --> DASH

DASH --> MODELTUNE
MODELTUNE --> NMODEL
