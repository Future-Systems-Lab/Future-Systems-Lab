// Rights Reserved, Unlicensed
pragma solidity ^0.8.20;

contract NeuroBalanceConsent {

    struct Consents {
        bool educationalDisclaimer;
        bool healthDataAccess;
        bool notifications;
        bool backgroundMonitoring;
        bool dataProcessing;
        bool localStorage;
        bool offChainStorage;
        bool blockchainLogging;
        bool dataSharing;
        bool thirdPartyAccess;
        bool emergencyOverride;
    }

    mapping(address => Consents) public userConsents;

    event ConsentUpdated(address indexed user, string consentType, bool value);
    event AllConsentsRevoked(address indexed user);

    modifier onlyUser(address user) {
        require(msg.sender == user, "Not authorized");
        _;
    }

    function setConsent(address user, string calldata consentType, bool value) external onlyUser(user) {
        if (keccak256(bytes(consentType)) == keccak256(bytes("educationalDisclaimer"))) userConsents[user].educationalDisclaimer = value;
        else if (keccak256(bytes(consentType)) == keccak256(bytes("healthDataAccess"))) userConsents[user].healthDataAccess = value;
        else if (keccak256(bytes(consentType)) == keccak256(bytes("notifications"))) userConsents[user].notifications = value;
        else if (keccak256(bytes(consentType)) == keccak256(bytes("backgroundMonitoring"))) userConsents[user].backgroundMonitoring = value;
        else if (keccak256(bytes(consentType)) == keccak256(bytes("dataProcessing"))) userConsents[user].dataProcessing = value;
        else if (keccak256(bytes(consentType)) == keccak256(bytes("localStorage"))) userConsents[user].localStorage = value;
        else if (keccak256(bytes(consentType)) == keccak256(bytes("offChainStorage"))) userConsents[user].offChainStorage = value;
        else if (keccak256(bytes(consentType)) == keccak256(bytes("blockchainLogging"))) userConsents[user].blockchainLogging = value;
        else if (keccak256(bytes(consentType)) == keccak256(bytes("dataSharing"))) userConsents[user].dataSharing = value;
        else if (keccak256(bytes(consentType)) == keccak256(bytes("thirdPartyAccess"))) userConsents[user].thirdPartyAccess = value;
        else if (keccak256(bytes(consentType)) == keccak256(bytes("emergencyOverride"))) userConsents[user].emergencyOverride = value;

        emit ConsentUpdated(user, consentType, value);
    }

    function revokeAll(address user) external onlyUser(user) {
        userConsents[user] = Consents(
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false,
            false
        );
        emit AllConsentsRevoked(user);
    }
}
