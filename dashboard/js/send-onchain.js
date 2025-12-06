// Rights Reserved, Unlicensed
import { createPublicClient, createWalletClient, http, custom } from "viem";
import { sepolia } from "viem/chains";
import fs from "node:fs";
import path from "node:path";

const complianceLogPath = path.resolve("../abi/ComplianceLog.json");
const userActivityPath = path.resolve("../abi/UserActivity.json");

const complianceLogABI = JSON.parse(fs.readFileSync(complianceLogPath, "utf8"));
const userActivityABI = JSON.parse(fs.readFileSync(userActivityPath, "utf8"));

const complianceLogAddress = "0xb169383145070fbC19EF972569E6ec35B253a69F";
const userActivityAddress = "0x2cc949E7C4e8Ab0ec4F35dAf251D5c2C8a2bA848";

const publicClient = createPublicClient({
    chain: sepolia,
    transport: http("https://sepolia.infura.io/v3/"),
});

export async function sendToBlockchain(sessionHash) {
    if (!window.ethereum) throw new Error("MetaMask not detected");

    const walletClient = createWalletClient({
        chain: sepolia,
        transport: custom(window.ethereum),
    });

    const [user] = await walletClient.getAddresses();

    await walletClient.writeContract({
        address: userActivityAddress,
        abi: userActivityABI,
        functionName: "logSession",
        args: [user, sessionHash],
    });

    await walletClient.writeContract({
        address: complianceLogAddress,
        abi: complianceLogABI,
        functionName: "recordEvent",
        args: [user, "ai_session_recorded", sessionHash],
    });

    return { status: "ok", user, sessionHash };
}
