// Rights Reserved, Unlicensed
pragma solidity ^0.8.20;

contract ComplianceLog {
    address public owner;

    struct Entry {
        uint256 id;
        address user;
        string action;
        uint256 timestamp;
    }

    mapping(uint256 => Entry) public entries;
    uint256 public counter;

    constructor() {
        owner = msg.sender;
    }

    function logAction(address user, string memory action) external {
        counter++;
        entries[counter] = Entry(counter, user, action, block.timestamp);
    }
}
