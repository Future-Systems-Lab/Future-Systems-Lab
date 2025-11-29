// Rights Reserved, Unlicensed
pragma solidity ^0.8.20;

contract ConsentPolicy {

    struct ConsentRecord {
        address user;
        bytes32 consentHash;
        uint256 timestamp;
        bool active;
    }

    struct RevocationRecord {
        address user;
        bytes32 consentHash;
        uint256 timestamp;
    }

    mapping(address => ConsentRecord[]) public consents;
    mapping(address => RevocationRecord[]) public revocations;

    event ConsentSigned(address indexed user, bytes32 consentHash, uint256 timestamp);
    event ConsentRevoked(address indexed user, bytes32 consentHash, uint256 timestamp);

    function signConsent(bytes32 consentHash) external {
        ConsentRecord memory record = ConsentRecord({
            user: msg.sender,
            consentHash: consentHash,
            timestamp: block.timestamp,
            active: true
        });

        consents[msg.sender].push(record);

        emit ConsentSigned(msg.sender, consentHash, block.timestamp);
    }

    function revokeConsent(bytes32 consentHash) external {
        uint256 count = consents[msg.sender].length;

        for (uint256 i = 0; i < count; i++) {
            if (consents[msg.sender][i].consentHash == consentHash &&
                consents[msg.sender][i].active == true
            ) {
                consents[msg.sender][i].active = false;

                RevocationRecord memory revRecord = RevocationRecord({
                    user: msg.sender,
                    consentHash: consentHash,
                    timestamp: block.timestamp
                });

                revocations[msg.sender].push(revRecord);

                emit ConsentRevoked(msg.sender, consentHash, block.timestamp);
                return;
            }
        }
    }

    function getActiveConsents(address user) external view returns (ConsentRecord[] memory) {
        uint256 count = consents[user].length;
        uint256 activeCount = 0;

        for (uint256 i = 0; i < count; i++) {
            if (consents[user][i].active == true) {
                activeCount++;
            }
        }

        ConsentRecord[] memory result = new ConsentRecord[](activeCount);
        uint256 idx = 0;

        for (uint256 i = 0; i < count; i++) {
            if (consents[user][i].active == true) {
                result[idx] = consents[user][i];
                idx++;
            }
        }

        return result;
    }

    function getRevocations(address user) external view returns (RevocationRecord[] memory) {
        return revocations[user];
    }
}
