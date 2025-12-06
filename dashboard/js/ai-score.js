// Rights Reserved, Unlicensed
export async function getAIScore(inputs) {
    const response = await fetch("http://localhost:8000/score", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(inputs)
    });

    const result = await response.json();
    return result;
}
