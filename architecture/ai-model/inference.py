# Rights Reserved, Unlicensed

import torch
import torch.nn as nn
import numpy as np
import pandas as pd
from model import WellnessModel
from sklearn.preprocessing import StandardScaler

df = pd.read_csv("wellness_dataset.csv")
X = df.drop("score", axis=1).values

scaler = StandardScaler()
scaler.fit(X)

input_dim = X.shape[1]
output_dim = 1

model = WellnessModel(input_dim, output_dim)
model.load_state_dict(torch.load("model_weights.pth"))
model.eval()


def predict_wellness(input_dict):
    features = np.array(
        [
            input_dict["hrv"],
            input_dict["rmssd"],
            input_dict["sdnn"],
            input_dict["stress_index"],
            input_dict["resp_rate"],
            input_dict["skin_conductance"],
            input_dict["sleep_quality"],
            input_dict["circadian_phase"],
            input_dict["step_count"],
            input_dict["temperature"],
            input_dict["bp_systolic"],
            input_dict["bp_diastolic"],
        ]
    ).reshape(1, -1)

    features_scaled = scaler.transform(features)
    tensor = torch.tensor(features_scaled, dtype=torch.float32)

    with torch.no_grad():
        pred = model(tensor).item()

    return pred


if __name__ == "__main__":
    sample = {
        "hrv": 48,
        "rmssd": 29,
        "sdnn": 32,
        "stress_index": 140,
        "resp_rate": 14.2,
        "skin_conductance": 2.8,
        "sleep_quality": 74,
        "circadian_phase": 1,
        "step_count": 5600,
        "temperature": 36.4,
        "bp_systolic": 118,
        "bp_diastolic": 76,
    }

    print("Predicted Wellness Score:", predict_wellness(sample))
