# Rights Reserved, Unlicensed
from web3 import Web3
import json

# Sepolia RPC
w3 = Web3(
    Web3.HTTPProvider("https://sepolia.infura.io/v3/9aa57ad06781409c8a2db52c2997992e")
)

# Contract info
contract_address = "0x3Be8285F089cb53ed811CF0d8c79c19D8245db09"
contract_abi = json.loads(
    open(
        "/Users/margaritamontanez/Future-Systems-Lab/EncryptHealthSessionStore_abi.json"
    ).read()
)


contract = w3.eth.contract(address=contract_address, abi=contract_abi)

# Final EncryptHealth session hash (3-field version)
session_hash = "0x8e14b50c9afadf00d22b8c44c83f11ce4b2c098aea85b65d44e7af704670a68c"

# Build the transaction
tx = contract.functions.storeSessionHash(session_hash).build_transaction(
    {
        "from": w3.to_checksum_address(0x3BE8285F089CB53ED811CF0D8C79C19D8245DB09),
        "nonce": w3.eth.get_transaction_count(
            0x3BE8285F089CB53ED811CF0D8C79C19D8245DB09
        ),
        "gas": 250000,
        "gasPrice": w3.to_wei("4", "gwei"),
    }
)

# Sign & send
signed = w3.eth.account.sign_transaction(
    tx, e789f757edac6c8386751362dfbd9e52ec0237f61c69042ed27f2820a467b4ab
)
tx_hash = w3.eth.send_raw_transaction(signed.rawTransaction)

print("TX HASH:", tx_hash.hex())
