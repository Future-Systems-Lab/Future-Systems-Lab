// Rights Reserved, Unlicensed
import { getAIScore } from "./ai-score.js";
import { sendToBlockchain } from "./send-onchain.js";

export async function submitAISession(inputs) {
    const aiResult = await getAIScore(inputs);
    const sessionHash = aiResult.session_hash;
    const chainResult = await sendToBlockchain(sessionHash);

    return {
        ai: aiResult,
        blockchain: chainResult
    };
}
