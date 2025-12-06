# Rights Reserved, Unlicensed

import torch
import torch.nn as nn
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from model import WellnessModel

df = pd.read_csv("wellness_dataset.csv")

X = df.drop("score", axis=1).values
y = df["score"].values

scaler = StandardScaler()
X = scaler.fit_transform(X)

X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=42
)

input_dim = X_train.shape[1]
output_dim = 1

model = WellnessModel(input_dim, output_dim)
criterion = nn.MSELoss()
optimizer = torch.optim.Adam(model.parameters(), lr=0.001)

X_train_tensor = torch.tensor(X_train, dtype=torch.float32)
y_train_tensor = torch.tensor(y_train, dtype=torch.float32).unsqueeze(1)

for epoch in range(50):
    optimizer.zero_grad()
    preds = model(X_train_tensor)
    loss = criterion(preds, y_train_tensor)
    loss.backward()
    optimizer.step()

torch.save(model.state_dict(), "model_weights.pth")
