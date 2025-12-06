<!-- Rights Reserved, Unlicensed -->

# 🧪 AI Model — Training Dataset Generation (Phase 4)

This document defines how to generate a structured, realistic, hash-verified dataset for model training.
All data is synthetic but follows real biochemical + behavioral logic.

---

# 1.0 Dataset Size & Structure

- **Rows:** 5,000 (initial prototype)
- **Format:** Parquet + CSV + NPY
- **Split:**
  - 70% training
  - 15% validation
  - 15% test
- **Seed:** `42` (ensures reproducibility)

---

# 2.0 Biochemical Pattern Logic

Each synthetic user profile follows physiologically-plausible ranges and correlations.

### Serotonin-related patterns
Low serotonin tends to correlate with:
- Racing_Thoughts = 1
- Overwhelm = 1
- Sleep disturbance → lower HRV
- Restless or Tightness flags = 1

### Dopamine-related patterns
Low dopamine correlates with:
- Flat = 1
- Withdrawn = 1
- Motion_Amplitude reduced
- Session_Duration shortened

### GABA patterns
Low GABA →
- KeyedUp = 1
- Racing_Thoughts = 1
- Rapid HeartRate_Drift

### Cortisol & HRV
High cortisol tends to correlate with:
- Overwhelm = 1
- Elevated HeartRate
- Lower HRV
- Shorter breath cadence

### Micronutrient logic
- **B6, Magnesium** influence GABA stability
- **B12, Folate** influence Dopamine/Serotonin ratios
- **Omega-3** affects inflammation → HRV & mood flags

The generator uses weighted rules so that symptoms match biochemical states.

---

# 3.0 Wearable Sensor Logic

Sensors follow realistic covariance:

- High stress → ↑ HR → ↓ HRV → ↑ Motion noise
- Deep calm → ↑ Stillness_Duration → ↓ HeartRate_Drift
- Overstimulation → ↑ Wrist_Temp → ↑ MicroShake_Index
- Strong narrative engagement → ↑ Session_Duration

All wearable features follow Gaussian sampling within validated physiologic ranges.

---

# 4.0 Cognitive/Symptom Logic

Binary flags follow weighted conditional probabilities:

Example:
- If Serotonin_Index < 0.3 → Racing_Thoughts P=0.75, Foggy P=0.55
- If Dopamine_Index < 0.3 → Flat P=0.80, Withdrawn P=0.70
- If GABA_Index < 0.3 → KeyedUp P=0.85

These ensure realism and internal consistency.

---

# 5.0 Hash Generation Logic

Each row includes:

- `SessionHash`
- `ConsentHash`
- `ActivityHash`

Hashes are computed as:


SessionHash = keccak256(session_feature_string)
ConsentHash = keccak256(consent_payload_string)
ActivityHash = keccak256(activity_payload_string)

Rules:
- Keccak-256, 0x-prefixed, 66 chars
- Deterministic: same row → same hash
- Changing any field → new hash

---

# 6.0 On-Chain Timestamp Simulation

Each synthetic row includes:
- `Timestamp_OnChain` = simulated block timestamp
- Must respect sequence:
  Consent < Session < Activity

Timestamps sampled within realistic increments:
- Consent → +0–3 minutes
- Session → +2–15 minutes
- Activity → +1–30 seconds

---

# 7.0 Protocol-Level Assignment

Rows randomized:

- 50% L1
- 30% L2
- 20% L3

Each level influences sensor/biochemical coherence:

- **L1:** calmer physiology, shorter sessions
- **L2:** biochemical rebalancing patterns
- **L3:** narrative engagement → longer sessions, higher stillness

---

# 8.0 Output Specification

Generate 3 files:

### 1. `training_set.csv`
Human-readable full dataset.

### 2. `training_set.parquet`
Efficient analytic format.

### 3. `training_vectors.npy`
Final normalized vectors for model training.

All appear under:

`/ai-model/datasets/phase1/`

---

# 9.0 Reproducibility

The generator must:
- Use seed=42
- Print config summary
- Validate output shapes
- Generate checksum file for dataset integrity

Example checksum:
