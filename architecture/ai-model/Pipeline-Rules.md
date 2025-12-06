<!-- Rights Reserved, Unlicensed -->

# 🔄 AI Model — Data Pipeline Rules (Phase 3)

This document defines the preprocessing, normalization, and cryptographic verification rules for all model inputs.

These rules ensure:
- clean data
- standardized scaling
- reproducible training
- blockchain-attested provenance

---

# 1.0 Preprocessing Workflow (High-Level)

1. **Load raw feature vector** (biochemical + wearable + cognitive + session + on-chain hashes)
2. **Verify source integrity using hashes**
3. **Handle missing values**
4. **Normalize continuous features**
5. **Encode categorical + binary fields**
6. **Assemble final vector for model ingestion**

The same process runs during both training and inference.

---

# 2.0 Blockchain Hash Verification

Every row must include:

- `SessionHash`
- `ConsentHash`
- `ActivityHash`
- `Timestamp_OnChain`

Verification rules:

- Hashes must be **valid hex strings (0x…)**
- Length must match Keccak-256 format (66 chars total)
- SessionHash must match recomputed hash of session data
- ConsentHash must match hash stored at ConsentPolicy contract
- ActivityHash must match hash stored at UserActivity contract
- Timestamp_OnChain must be ≥ session start time

Rows failing verification are rejected.

---

# 3.0 Continuous Feature Normalization

Apply **0–1 MinMax scaling**:


x_norm = (x - min) / (max - min)

Applies to:

- Serotonin_Index
- Dopamine_Index
- GABA_Index
- Glutamate_Index
- B6_Level
- B12_Level
- Folate_Level
- Omega3_Index
- Magnesium_Level
- Ferritin_Level
- Cortisol_Baseline
- HRV_Baseline
- HeartRate_Peak
- HeartRate_Drift
- Breath_Cadence
- Motion_Amplitude
- Wrist_Temp
- MicroShake_Index
- Stillness_Duration
- Screen_Gaze_Time
- Session_Duration_Min

Out-of-range values → **clip to [0,1]**.

---

# 4.0 Binary + Categorical Encoding

Binary flags (0 or 1):

- Racing_Thoughts
- Overwhelm
- Withdrawn
- Foggy
- Looping
- Tightness
- Restless
- Heavy
- Detached
- KeyedUp
- Flat

Categorical:

### **Protocol_Level**
Encode:
- L1 → 0
- L2 → 1
- L3 → 2

### **TimeOfDay**
Encode:
- Morning → 0
- Afternoon → 1
- Evening → 2
- Night → 3

---

# 5.0 Missing Data Policy

### **Continuous:**
- If missing → impute with median of training set
- If still unavailable → impute with 0.5 (neutral midpoint)
- Log event to audit trail

### **Binary/Categorical:**
- Missing binaries → 0
- Missing categorical → “unknown” bucket encoded as -1

### **Hash fields may never be missing.**
If missing → row rejected.

---

# 6.0 Final Vector Assembly

Final vector structure:


[
normalized_biochemical,
normalized_wearables,
binary_symptoms,
encoded_categorical,
normalized_session_meta,
validated_hashes
]

All vectors output as a fixed length array for training compatibility.

---

# 7.0 Output Specs

- Output vector stored as `.npy`
- Versioned under `/ai-model/preprocessed/`
- All transformations logged to blockchain event bus (future phase)
