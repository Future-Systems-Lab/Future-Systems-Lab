# Blockchain Architecture — Future Systems Lab
Designed by Meg Montañez-Davenport
Dark-Mode UML (Function Groups + Events + Roles)

flowchart LR

%% ========= CLASS DEFINITIONS =========
classDef contract fill:#0a1a1f,stroke:#1be4d8,stroke-width:1.5px,color:#ffffff;
classDef role fill:#071014,stroke:#00c8ff,stroke-width:1.2px,color:#ffffff;
classDef event fill:#061417,stroke:#00ffc8,stroke-width:1.2px,color:#ffffff;
classDef api fill:#0b0f11,stroke:#1be4d8,stroke-width:1.2px,color:#ffffff;

%% ========= CONSENT LAYER =========
subgraph CONSENT["Consent Layer Contracts"]
    CP["ConsentPolicy.sol
    — Functions —
    • setConsent()
    • revokeConsent()
    • getConsentStatus()
    — Events —
    • ConsentGranted
    • ConsentRevoked"]:::contract

    NBC["NeuroBalanceConsent.sol
    — Functions —
    • setToggle()
    • getToggle()
    — Events —
    • ToggleUpdated"]:::contract

    AEL["AdverseEventLog.sol
    — Functions —
    • reportEvent()
    • getEvent()
    — Events —
    • AdverseEventReported"]:::contract
end

%% ========= ACCESS CONTROL =========
AC["AccessControl.sol
— Roles —
• ADMIN
• PROVIDER
• DEVICE
— Functions —
• grantRole()
• revokeRole()
• hasRole()
— Event —
• RoleGranted
• RoleRevoked"]:::contract

%% ========= SESSION LAYER =========
subgraph SESSION["Session Layer Contracts"]
    EHS["EncryptHealthSessionStore.sol
    — Functions —
    • storeSession()
    • getSession()
    — Events —
    • SessionStored"]:::contract

    HNS["HypnoNeuroSessionStore.sol
    — Functions —
    • recordSession()
    • fetchSession()
    — Events —
    • SessionRecorded"]:::contract
end

%% ========= TOKEN LAYER =========
subgraph TOKENS["Token Layer Contracts"]
    WT["WellnessToken.sol
    (ERC-20)
    — mintReward()
    — burn()
    — transfer()
    — Event: Transfer"]:::contract

    OT["OrthomolecularToken.sol
    (ERC-20)
    — mintLabReward()
    — transfer()
    — Event: Transfer"]:::contract

    HT["HypnoNeuroToken.sol
    (ERC-20)
    — mintCompletionReward()
    — transfer()
    — Event: Transfer"]:::contract

    NFT["MindMasteryNFTs.sol
    (ERC-721)
    — mintAchievement()
    — tokenURI()
    — Event: NFTMinted"]:::contract
end

%% ========= ROLES =============
Admin["ADMIN Role"]:::role
Provider["PROVIDER Role"]:::role
Device["DEVICE Role"]:::role

%% ========= API SURFACES =========
ConsentAPI["Consent API<br/>(writeConsent, updateToggle)"]:::api
SessionAPI["Session API<br/>(storeSession, fetchSession)"]:::api
TokenAPI["Token API<br/>(issueReward, mintNFT)"]:::api

%% ========= FLOWS =========

%% Consent API → Consent Contracts
ConsentAPI --> CP
ConsentAPI --> NBC
ConsentAPI --> AEL

%% Session API → Session Stores
SessionAPI --> EHS
SessionAPI --> HNS

%% Token API → Token Layer
TokenAPI --> WT
TokenAPI --> OT
TokenAPI --> HT
TokenAPI --> NFT

%% Roles → Access Control
Admin --> AC
Provider --> AC
Device --> AC

%% Access Control → All permissioned contracts
AC --> CP
AC --> NBC
AC --> AEL
AC --> EHS
AC --> HNS
AC --> WT
AC --> OT
AC --> HT
AC --> NFT
