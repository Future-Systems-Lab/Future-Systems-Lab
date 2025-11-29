// Rights Reserved, Unlicensed
pragma solidity ^0.8.20;

contract EncryptHealthSessionStore {
    address public owner;

    mapping(uint256 => string) public sessionHashes;

    constructor() {
        owner = msg.sender;
    }

    function storeSessionHash(uint256 sessionId, string calldata recHash) external {
        sessionHashes[sessionId] = recHash;
    }

    function getSessionHash(uint256 sessionId) external view returns (string memory) {
        return sessionHashes[sessionId];
    }
}
