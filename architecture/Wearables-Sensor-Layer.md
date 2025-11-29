<!-- Rights Reserved, Unlicensed -->

# ⌚ Wearables & Sensor Layer  
Defines the real-time physiological, behavioral, and device-specific inputs that feed the AI engine and on-chain structures across the Future Systems Lab ecosystem.

---

# 1.0 Overview  
The Wearables & Sensor Layer collects multi-modal signals from watches, patches, and mobile sensors, links them to a pseudonymous user ID, processes them off-chain, and anchors event hashes on-chain for verifiability.

This unifies:
- **Somatic patterns** (HRV, heart rate, tension)
- **Cognitive-behavioral patterns** (loops, focus, pacing)
- **Environmental cues** (sound, light, motion)
- **NeuroBalance Consent signals** (on/off toggles)

---

# 2.0 Device Types

## 2.1 NeuroBalance Watch  
- HR / HRV  
- Breath rate  
- Movement  
- Session compliance  
- Daily sync signatures  
- WT token eligibility (via UserActivity contract)

## 2.2 Wearable Patch  
- Dopamine trend estimate  
- Stress signal proxy  
- Micro-movement  
- Session resonance match

## 2.3 Phone-Based Sensors  
- Touch cadence  
- Voice steadiness  
- Cognitive-intensity proxies  
- App-level interaction states

---

# 3.0 On-Chain Links

Each device routes into:

### **UserActivity.sol**  
Address: `0x2cc949E7C4e8Ab0ec4F35dAf251D5c2C8a2bA848`  
- Sensor events  
- Sync events  
- WT reward eligibility  

### **NeuroBalanceConsent.sol**  
Address: `0x59bF3605e1e62867Ad880eb5451789290F56E369`  
- Controls whether device data is used  
- Controls whether session hashes can be linked  
- User-controlled toggles

### **ComplianceLog.sol**  
Address: `0xb169383145070fbC19EF972569E6ec35B253a69F`  
- Event record  
- Consent enforcement results  
- Device-level audit trail

---

# 4.0 Data Flow

```mermaid
flowchart TD

    D[Wearable / Patch / Phone Sensor] --> P[Preprocessing Layer]
    P --> F[Feature Extraction]
    F --> AI[AI Engine]

    AI --> H[Hash Generator]
    H --> BC[(Blockchain Layer)]

    AI --> SQL[(SQL Lab + Sensor Tables)]
    SQL --> R[Recommendations Engine]

    U[User Wallet] --> NB[NeuroBalanceConsent]
    NB --> BC
5.0 Preprocessing & Feature Engineering
5.1 Preprocessing

Signal cleaning

Noise removal

Denoising filters

Missing-value imputation

Normalization

Artifact rejection

5.2 Features Extracted

Time-domain HRV metrics

Breath stability score

Movement vector coherence

Stress flicker index

Interaction cadence

NeuroBalance toggle state

These become the model inputs that correlate with biochemical and behavioral patterns.

6.0 On-Chain Event Mapping
Action	Contract	Event
Daily sync	UserActivity	DeviceSynced
High-quality data streak	UserActivity	StreakAchieved
Consent toggle change	NeuroBalanceConsent	ConsentUpdated
AI-recommended alignment	ComplianceLog	AlignmentLogged
7.0 Privacy Controls

Sensor data stored off-chain

Only event hashes posted on-chain

Wearable → pseudonymized UserID → session hash → blockchain stamp

No raw biometric values ever touch blockchain

Consent gating enforced at device level

8.0 Summary

The Wearables & Sensor Layer forms the behavioral input foundation of the Future Systems Lab ecosystem.
It connects real-time physiological data with cryptographically verified session records, ensuring accuracy, privacy, and decentralized trust.

---

## 🔗 Wearables Architecture References

### Diagrams Directory
https://github.com/Future-Systems-Lab/Future-Systems-Lab/tree/main/architecture/diagrams

### Architecture Root Directory
https://github.com/Future-Systems-Lab/Future-Systems-Lab/tree/main/architecture

### Future Sensor Specification Files
(Future update) Sensor pattern tables and hardware profiles will be stored here:
https://github.com/Future-Systems-Lab/Future-Systems-Lab/tree/main/architecture/wearables

