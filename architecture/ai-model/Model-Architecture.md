<!-- Rights Reserved, Unlicensed -->

# 🧠 AI Model Architecture Specification (Phase 5)

This document defines the neural architecture for the Future Systems Lab AI system.
It integrates **biochemical indicators**, **symptom patterns**, **sensor signals**, and **session metadata** into a unified prediction model.

---

# 1.0 Input Schema

Model receives **three parallel input streams**:

## 1.1 Biochemical indices (normalized 0–1)
- Serotonin_Index
- Dopamine_Index
- GABA_Index
- Cortisol_Index

## 1.2 Wearable sensor signals
- HeartRate
- HRV
- Motion_Amplitude
- Motion_Noise
- Stillness_Duration
- Wrist_Temp

All normalized using feature-wise z-score.

## 1.3 Symptom + cognitive flags (binary)
- Racing_Thoughts
- Foggy
- KeyedUp
- Overwhelm
- Withdrawn
- Flat
- Restless
- Tightness

## 1.4 Protocol-level metadata
- Protocol_Level (L1 / L2 / L3 → one-hot)
- Session_Duration
- DeviceModel_ID (one-hot)

## 1.5 Hash-linked metadata
- SessionHash (converted to int embedding)
- ConsentHash (int embedding)
- ActivityHash (int embedding)

Hash embeddings ensure continuity with blockchain architecture.

---

# 2.0 Vectorization

All features transformed into a unified vector:


X = [
biochemical (4),
sensors (6),
symptoms (8),
metadata (N),
hash embeddings (96 dims)
]

Expected final vector length: **≈128–160 dims**, depending on one-hot sizes.

Hash embeddings use an embedding layer with dimension = 32.

---

# 3.0 Model Structure

The AI model uses a **Multimodal Encoder → Fusion → Predictor** design.

## 3.1 Biochemical Encoder (Dense block)
- Dense(32) → ReLU
- Dense(16) → ReLU
- Outputs 16-dim vector

## 3.2 Wearable Encoder (Temporal-style block)
Even though the snapshot is static, wearable signals behave like time-derived features.

Layer stack:
- Dense(64)
- BatchNorm
- GELU
- Dense(32)

Outputs 32-dim vector.

## 3.3 Symptom Encoder (Binary encoder)
- Dense(16)
- Dropout(0.1)
- Dense(8)

Outputs 8-dim vector.

## 3.4 Hash Encoder
Each hash (keccak256) is split into 32-byte chunks → embedded to 32 dims.
Concatenate all → 96-dim vector.

## 3.5 Fusion Layer
Concatenate all encoders:


F = concat(biochem, wearable, symptoms, hash)

Fusion block:
- Dense(128) → GELU
- Dense(64)
- LayerNorm

Outputs 64-dim fused vector.

---

# 4.0 Prediction Heads

The model supports **three prediction targets**, trained jointly:

## 4.1 Emotional State Vector (Regression)
Predicts:
- Calmness_Score
- Stress_Score
- Focus_Score

Loss: **MSE**

---

## 4.2 Biochemical Rebalance Recommendation (Classification)
Predicts recommended direction:
- Increase Serotonin
- Increase Dopamine
- Increase GABA
- Reduce Cortisol

Loss: **CrossEntropy**

---

## 4.3 HypnoNeuro Protocol Recommendation (Classification)
Predicts L1 / L2 / L3 session assignment.

Inputs include protocol-level metadata + symptoms.

Loss: **CrossEntropy**

---

# 5.0 Combined Loss Function

Total loss:


Loss = 0.5MSE_emotional +
0.3CE_biochemical_recommendation +
0.2*CE_protocol_level

Weights ensure emotional state prediction dominates.

---

# 6.0 Optimizer & Hyperparameters

- Optimizer: AdamW
- Learning Rate: 1e-4
- Batch Size: 64
- Epochs: 30 (prototype)
- LR Scheduler: cosine decay
- Weight Decay: 1e-2

---

# 7.0 Evaluation Metrics

- MSE (Emotional vectors)
- Accuracy (biochemical rec)
- Accuracy (protocol rec)
- F1-score (per class)
- R² for regression components

---

# 8.0 Export Format

Model exported as:

- `model.onnx` (primary)
- `model.pt` (PyTorch)
- `model.json` (tokenizer + metadata)

Each export includes:

- input shape
- version ID
- sha256 hash of weights
- timestamp
- reproducible seed

---

# 9.0 Next Step (Phase 6)

Next phase is **Building the Dataset Generator Script** (`generate_dataset.py`) which will produce the files defined in Phase 4.
