# Rights Reserved, Unlicensed
from fastapi import FastAPI
from pydantic import BaseModel
import hashlib
import json
import time

app = FastAPI()


class Inputs(BaseModel):
    stress_level: float
    magnesium: float
    b6: float
    glutamate: float


def generate_hash(data):
    encoded = json.dumps(data, sort_keys=True).encode()
    return hashlib.sha256(encoded).hexdigest()


@app.get("/test")
def test():
    return {"status": "ok"}


@app.post("/score")
def score(inputs: Inputs):
    wellness_score = round(
        (
            (10 - inputs.stress_level) * 5
            + (inputs.magnesium * 2)
            + (inputs.b6 * 2)
            - (inputs.glutamate * 3)
        ),
        2,
    )

    output = {
        "wellness_score": wellness_score,
        "biochemical_pattern": (
            "low_magnesium" if inputs.magnesium < 1.6 else "balanced"
        ),
        "neuro_state": "high_glutamate" if inputs.glutamate > 8 else "normal",
        "timestamp": int(time.time()),
    }

    session_hash = generate_hash(output)

    return {"model_output": output, "session_hash": session_hash}
