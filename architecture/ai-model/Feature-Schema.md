<!-- Rights Reserved, Unlicensed -->

# 🧬 AI Model — Feature Schema (Phase 2)

This schema defines all inputs the AI layer will accept.
It combines biochemical, behavioral, and on-chain event indicators into a single structured vector.

---

# 1.0 Biochemical Features (From Orthomolecular Mock Lab Table)

These are continuous numerical values:

- **Serotonin_Index**
- **Dopamine_Index**
- **GABA_Index**
- **Glutamate_Index**
- **B6_Level**
- **B12_Level**
- **Folate_Level**
- **Omega3_Index**
- **Magnesium_Level**
- **Ferritin_Level**
- **Cortisol_Baseline**
- **HRV_Baseline**

These support neurotransmitter balance predictions.

---

# 2.0 Wearable Micro-Patterns

These are placeholder values until the watch is fully implemented:

- **HeartRate_Peak**
- **HeartRate_Drift**
- **Breath_Cadence**
- **Motion_Amplitude**
- **Wrist_Temp**
- **MicroShake_Index**
- **Stillness_Duration**
- **Screen_Gaze_Time**

These allow early stress-pattern modeling.

---

# 3.0 Symptom & Cognitive Tags

Binary / categorical fields:

- **Racing_Thoughts**
- **Overwhelm**
- **Withdrawn**
- **Foggy**
- **Looping**
- **Tightness**
- **Restless**
- **Heavy**
- **Detached**
- **KeyedUp**
- **Flat**

These match the InstaPsych sensory taxonomy.

---

# 4.0 Session Metadata (Off-chain)

- **Session_Duration_Min**
- **TimeOfDay**
- **Protocol_Level** (L1 / L2 / L3)
- **Engagement_Score** (0–1)
- **Completion_Status**

---

# 5.0 Blockchain-Linked Features

These ensure verifiability:

- **SessionHash**
- **ConsentHash**
- **ActivityHash**
- **Timestamp_OnChain**
- **EventSignatureCount**
- **Wallet_ReputationScore** (future)

These allow models to verify provenance.

---

# 6.0 Unified Feature Vector Layout

Final training vector will concatenate:


[
biochemical_features,
wearable_features,
symptom_tags,
session_metadata,
blockchain_hashes
]

Standardized → normalized → passed to model pipeline in Phase 3.

---

# 7.0 Next Steps

After schema approval, the next file will define:

- Normalization rules
- Missing-data policies
- Hash validation requirements
- Pipeline adjacency
