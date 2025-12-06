// Rights Reserved, Unlicensed

import os
from web3 import Web3
import hashlib
import json

PRIVATE_KEY = os.getenv("EH_PRIVATE_KEY")
if not PRIVATE_KEY:
    raise ValueError("Missing environment variable: EH_PRIVATE_KEY")

w3 = Web3(Web3.HTTPProvider("https://eth-sepolia.g.alchemy.com/v2/demo"))

with open("EncryptHealthSessionStore.json") as f:
    abi = json.load(f)

contract = w3.eth.contract(
    address="0x3Be8285F089cb53ed811CF0d8c79c19D8245db09",
    abi=abi
)

session_string = "encrypthealth-session-001"
session_hash = hashlib.sha256(session_string.encode()).hexdigest()

account = w3.eth.account.from_key(PRIVATE_KEY)

tx = contract.functions.storeSessionHash(session_hash).build_transaction({
    "from": account.address,
    "nonce": w3.eth.get_transaction_count(account.address),
    "gas": 200000,
    "gasPrice": w3.to_wei("2", "gwei")
})

signed = account.sign_transaction(tx)
tx_hash = w3.eth.send_raw_transaction(signed.raw_transaction)

print("Session Hash:", session_hash)
print("TX:", tx_hash.hex())
